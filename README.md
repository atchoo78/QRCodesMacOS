# QR codes on macOS using Swift

This is how we can use the package. It creates a QR code given text, quality, size, and color parameters.

```swift
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
```

## Generated QR codes
![Codes](https://github.com/cristhianleonli/qr-codes-macos/blob/main/screnshots/codes.png)