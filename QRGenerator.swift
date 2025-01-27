import Cocoa
import Foundation

struct QRGenerator {
    static func create(text: String, background: QRCode.BackgroundColor, color: QRCode.PointColor, size: CGFloat, correction: QRCode.Quality) -> NSImage? {
        guard
            let background = createBackgroundImage(color: background, size: size),
            let pixel = createForegroundImage(text: text, color: color, correction: correction, size: size) else {
                return nil
        }
        
        // Merge back and foreground
        let result = background.merge(with: pixel)
      
        // Make sure the result image has the output size
        return result?.resize(w: size, h: size)
    }
    
    static func createBackgroundImage(color: QRCode.BackgroundColor, size: CGFloat) -> NSImage? {
        // create a view with of desired size
        let view = NSView(frame: NSRect(origin: .zero, size: CGSize(width: size, height: size)))
        
        // apply the color
        view.layer?.backgroundColor = color.start.cgColor
        
        // draw the background
        let image = NSImage(size: NSSize(width: size, height: size))
        image.lockFocus()
        color.start.drawSwatch(in: NSRect(origin: .zero, size: CGSize(width: size, height: size)))
        image.unlockFocus()
        
        // If there's an end color, it means, a gradient is required.
        if let backgroundEndColor = color.end {
            return image.maskWithGradient(start: color.start, end: backgroundEndColor)
        }
        
        // If not gradient is required, return the image with the solid background
        return image
    }
    
    static func createForegroundImage(text: String, color: QRCode.PointColor, correction: QRCode.Quality, size: CGFloat) -> NSImage? {
        // Create the points of the QR code that will hold the encoded string
        guard let qr = generateQrImage(from: text, pixelColor: color.start, correction: correction) else {
            return nil
        }
        
        // scale the image keeping the original ratio.
        let ciImageSize = qr.extent.size
        let widthRatio = size / ciImageSize.width
        let transform = CGAffineTransform(scaleX: widthRatio, y: widthRatio)
        let resizedQr = qr.transformed(by: transform)
        
        // create an image representation to be able to
        let rep = NSCIImageRep(ciImage: resizedQr)
        let image = NSImage(size: rep.size)
        image.addRepresentation(rep)
        
        // if there's an end color, it means a gradient mask is required
        if let pointEndColor = color.end {
            return image.maskWithGradient(start: color.start, end: pointEndColor)
        }
        
        return image
    }
    
    static func generateQrImage(from string: String, pixelColor: NSColor, correction: QRCode.Quality) -> CIImage? {
        // create the CIFilter
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        
        // encode the data
        let qrData = string.data(using: String.Encoding.utf8)
        
        qrFilter.setDefaults()
        qrFilter.setValue(qrData, forKey: "inputMessage")
        qrFilter.setValue(correction.singleLetter, forKey: "inputCorrectionLevel")
        
        // use the filter CIFalseColor to give color to the pixels
        guard let colorFilter = CIFilter(name: "CIFalseColor") else {
            return nil
        }
        
        // set the color values to the qr color filter
        colorFilter.setDefaults()
        colorFilter.setValue(qrFilter.outputImage, forKey: "inputImage")
        colorFilter.setValue(CIColor(color: pixelColor), forKey: "inputColor0")
        colorFilter.setValue(CIColor(color: .clear), forKey: "inputColor1")
        
        return colorFilter.outputImage
    }
}
