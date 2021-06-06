import Cocoa
import Foundation

class SampleViewController: NSViewController {
    
    func generateQrCode() -> NSImage? {
        let text = "https://cristhianleonli.medium.com"
        let correction = QRCodeCorrection.medium
        let size: CGFloat = 400
        
        let pointColor = QRCodeColor.gradient(
            start: .gray,
            end: .blue
        )
        
        let backgroundColor = QRCodeColor.solid(
            color: NSColor.orange
        )
        
        return QRGenerator.create(
            text: text,
            pointColor: pointColor,
            backgroundColor: backgroundColor,
            size: size,
            correction: correction
        )
    }
}
