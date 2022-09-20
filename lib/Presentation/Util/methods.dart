import 'package:flutter/material.dart';

class Method {
  Future<String> pickDate({BuildContext? context}) async {
    DateTime? newDate = await showDatePicker(
        context: context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(3000));

    if (newDate != null) {
      DateTime? date = newDate;
      return "${date.day}/${date.month}/${date.year}";
    }
    return '';
  }
}
