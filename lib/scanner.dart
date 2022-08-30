import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code/services/auth.dart';

class Scanner extends StatefulWidget {
  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  var qrstr = 'Recording my aatendance';
  var height, width;
AuthBase authBase=AuthBase();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black45,
          elevation: 0.0,
          actions:<Widget> [
          IconButton(
          onPressed: ()
      {
        authBase.logout();
        Navigator.of(context).pushReplacementNamed('login');
      },
      icon: Icon(Icons.exit_to_app, color: Colors.white,)
          )
      ],
      title: Text('Scanning QR code'),
    ),
    body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Text(
    qrstr,
    style: TextStyle(color: Colors.blueGrey, fontSize: 30),
    ),
    ElevatedButton(onPressed: ScanQ_R, child: Text('Scanner'),),
    SizedBox(
    width: height,
    ),
    ],
    )
    ,
    )
    ,
    );
  }

  Future<void> ScanQ_R() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2a99CF', 'cancel', true, ScanMode.QR)
          .then((value) {
        qrstr = value;
      });
    } catch (e) {
      setState(() {
        qrstr = 'unable to read this';
      });
    }
  }
}
