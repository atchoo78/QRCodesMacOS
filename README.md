# QR codes on macOS using Swift 5


Example usage. It creates a QR code given text, quality, size, and color parameters. It also demonstrates how to parse and validate the generated QR code as soon as it's generated.

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
    	let size: CGFloat = 600
    
    	let pointColor = QRCode.PointColor(<img width="153" alt="qr5" src="https://user-images.githubusercontent.com/20549049/220308914-bed96b3f-b221-44b6-8a9d-67ae8bd34c32.png">

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
<img width="153" alt="qr3" src="https://user-images.githubusercontent.com/20549049/220308679-7aea4c70-322e-44d1-a624-9cd7d499997f.png"> <img width="153" alt="qr5" src="https://user-images.githubusercontent.com/20549049/220308955-bb90dba9-9124-4d5c-9258-afae9191eeef.png">
