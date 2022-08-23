import 'package:flutter/material.dart';

class CommonAlertDialog extends AlertDialog {
  final Widget child;

  const CommonAlertDialog({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12))),
      contentPadding: const EdgeInsets.all(0.1),
      content: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: child,
      ),
    );
  }
}
