import 'package:flutter/material.dart';

class ProgressHud extends StatefulWidget {
  ProgressHud({this.isTransparent = false});

  final bool isTransparent;

  @override
  _ProgressHudState createState() => _ProgressHudState();
}

class _ProgressHudState extends State<ProgressHud> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());

    return Stack(
      children: <Widget>[
        Opacity(
          opacity: widget.isTransparent == true ? 0 : 0.4,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black,
          ),
        ),
        Center(
          child: Container(
            width: 70,
            height: 70,
            child: CircularProgressIndicator(
              strokeWidth: 6.5,
            ),
          ),
        ),
      ],
    );
  }
}
