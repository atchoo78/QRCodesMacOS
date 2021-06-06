import Cocoa
import Foundation

struct QRCode {
    enum Quality {
        case low
        case medium
        case high
        case highest
        
        var singleLetter: String {
            switch self {
            case .low: return "L"
            case .medium: return "M"
            case .high: return "Q"
            case .highest: return "H"
            }
        }
    }
    
    struct Color {
        var pointStart: NSColor
        var pointEnd: NSColor?
        var backgroundStart: NSColor
        var backgroundEnd: NSColor?
    }
}
