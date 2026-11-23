import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  void showSuccessMessage(String message) => _show(message, Colors.green);
  void showErrorMessage(String message) => _show(message, Colors.red);
  void showWarningMessage(String message) => _show(message, Colors.orange);
  void showInfoMessage(String message) => _show(message, Colors.blue);
  void showMessage(String message) => _show(message, Colors.black87);

  void _show(String message, Color color) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
