import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/models/session.dart';

class DisplayQrCode extends StatefulWidget {
  @override
  _DisplayQrCodeState createState() => _DisplayQrCodeState();
}

class _DisplayQrCodeState extends State<DisplayQrCode> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImage(
        data: '${inject<Session>().person.id}',
        version: QrVersions.auto,
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(32),
      ),
    );
  }
}
