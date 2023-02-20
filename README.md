# QR codes on macOS using Swift 5
#### This is forked from github.com/cristhianleonli/QRCodesMacOS


Example usage. It creates a QR code given text, quality, size, and color parameters. 

```swift

func makeQRCode() {
let text = "https://github.com/atchoo78/QRCodesMacOS"
let backgroundColorStart = .black
// Uncomment for Gradient background:
// let backgroundColorEnd = .gray
let pointColorStart = .red
// Uncomment for Gradient foreground color:
// let pointColorEnd = .purple

let generatedQR = generateQrCode(text: text!, pointColorStart: pointColorStart, pointColorEnd: nil, backgroundColorStart: backgroundColorStart, backgroundColorEnd: nil)

// update UI
<Some ImageView>.image = generatedQR
if(parseQR(QR: generatedQR!.ciImage())[0] != nil) {
	qrURLString = parseQR(QR: generatedQR!.ciImage())[0]
	<Some Textfield>.stringValue = qrURLString!
}


func generateQrCode(text: String, pointColorStart: NSColor, pointColorEnd: NSColor?, backgroundColorStart: NSColor, backgroundColorEnd: NSColor?) -> NSImage? {
   	    let correction = QRCode.Quality.high
    	let size: CGFloat = 400
    
    	let pointColor = QRCode.PointColor(
        	start: pointColorStart,
        	end: pointColorEnd
    	)
    
		let backgroundColor = QRCode.BackgroundColor(
        	start: backgroundColorStart,
        	end: backgroundColorEnd
    	)
    
    	return QRGenerator.create(
        	text: text,
			background: backgroundColor,
			color: pointColor,
        	size: size,
        	correction: correction
    	)
}
```

## Generated QR codes
![Codes](https://github.com/cristhianleonli/qr-codes-macos/blob/main/screnshots/codes.png)
