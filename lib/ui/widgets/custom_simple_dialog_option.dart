import 'package:flutter/material.dart';

class CustomSimpleDialogOption extends SimpleDialogOption {
  /// Creates an option for a [SimpleDialog].
  const CustomSimpleDialogOption({
    Key key,
    this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  final VoidCallback onPressed;

  @override
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: child,
      ),
    );
  }
}
