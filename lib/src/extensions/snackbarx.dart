import 'package:flutter/material.dart';

extension SnackbarX on BuildContext {
  showSnackbar(SnackBar snackBar) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
