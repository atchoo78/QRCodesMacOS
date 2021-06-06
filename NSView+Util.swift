import Cocoa
import Foundation

extension NSView {
    func toImage() -> NSImage? {
        guard let rep = bitmapImageRepForCachingDisplay(in: bounds) else {
            return nil
        }
        
        cacheDisplay(in: bounds, to: rep)
        let image = NSImage(size: rep.size)
        image.addRepresentation(rep)
        return image
    }
}
