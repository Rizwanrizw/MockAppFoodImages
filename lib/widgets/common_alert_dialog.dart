import 'package:flutter/material.dart';

class CommonAlertDialog extends StatefulWidget {
  final VoidCallback onPressed;
  final String message;

  const CommonAlertDialog({super.key, required this.message, required this.onPressed});

  @override
  State<CommonAlertDialog> createState() => _CommonAlertDialogState();
}

class _CommonAlertDialogState extends State<CommonAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(widget.message)),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            onPressed: () {
              widget.onPressed;
            },
            child: const Text(
                "Retry"
            )
        )
      ],
    );
  }
}
