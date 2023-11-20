import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Qrcode extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<Qrcode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          if (qrText != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Содержимое QR-кода: $qrText'),
            ),
          ElevatedButton(
            onPressed: () {
              controller?.dispose();
              Navigator.pop(context);
            },
            child: Text('Стоп и вернуться'),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code;
      });
      print('Scanned QR: $qrText');
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
