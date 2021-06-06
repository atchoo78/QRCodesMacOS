import Cocoa
import Foundation

class SampleViewController: NSViewController {
    
    func generateQrCode() -> NSImage? {
        let text = "https://cristhianleonli.medium.com"
        let correction = QRCode.Quality.medium
        let size: CGFloat = 400
        
        let color = QRCode.Color(
            pointStart: .gray,
            pointEnd: nil,
            backgroundStart: .blue,
            backgroundEnd: nil
        )
        
        return QRGenerator.create(
            text: text,
            color: color,
            size: size,
            correction: correction
        )
    }
}
