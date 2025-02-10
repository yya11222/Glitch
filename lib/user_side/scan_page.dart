import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? extractedData; // Stores extracted QR data
  String? displayMessage; // Stores the data to show the user

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        extractedData = scanData.code; // Extracts the QR content
      });

      // You can now use extractedData to provide more info to the user
      _processQRCode(extractedData);
    });
  }

  // This function simulates processing the extracted QR data
  void _processQRCode(String? data) {
    if (data != null) {
      if (data.startsWith("USER:")) {
        // Simulate fetching user info based on the QR code
        String userId = data.replaceFirst("USER:", "");
        displayMessage = "User ID: $userId\nFetching user profile...";
        // Here, you can call an API or a local DB to get user details
        setState(() {
          // Simulate profile info after fetching
          displayMessage = "User Profile:\nName: John Doe\nEmail: john@example.com";
        });
      } else if (Uri.tryParse(data)?.hasAbsolutePath ?? false) {
        displayMessage = "Detected URL: $data";
      } else {
        displayMessage = "Raw QR Data: $data";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Detection & Data Extraction")),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated, // Detects and extracts QR data
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    extractedData ?? "Scan a QR Code",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  if (displayMessage != null)
                    Text(
                      displayMessage!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  if (extractedData != null)
                    ElevatedButton(
                      onPressed: () {
                        _processQRCode(extractedData);
                      },
                      child: Text("Process Extracted Data"),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
