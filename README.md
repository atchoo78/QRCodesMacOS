# QR codes on macOS using Swift

This is how we can use the package. It creates a QR code given text, quality, size, and color parameters.

```swift
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
```

## Generated QR codes
![Codes](http://url/to/img.png)