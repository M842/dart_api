import 'package:flutter/material.dart';

import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

/// **1️⃣ Show Toast Message**
void showToast(String message, {Color backgroundColor = Colors.black}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}

/// **2️⃣ Validate Email**
bool isValidEmail(String email) {
  return RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
      .hasMatch(email);
}

/// **3️⃣ Validate Phone Number**
bool isValidPhone(String phone) {
  return RegExp(r"^\d{10,15}$").hasMatch(phone);
}

/// **4️⃣ Generate Random Number**
int getRandomNumber(int min, int max) {
  return min + Random().nextInt(max - min);
}

/// **5️⃣ Convert Timestamp to Readable Date**
String formatDateTime(DateTime date) {
  return DateFormat('yyyy-MM-dd HH:mm').format(date);
}

/// **6️⃣ Capitalize First Letter of a String**
String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

/// **7️⃣ Navigate to Another Screen**
void navigateTo(BuildContext context, Widget screen) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

/// **8️⃣ Remove Focus (Keyboard Close)**
void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

/// **9️⃣ Convert String to Double (Safe)**
double toDouble(String value) {
  return double.tryParse(value) ?? 0.0;
}

/// **🔟 Convert String to Int (Safe)**
int toInt(String value) {
  return int.tryParse(value) ?? 0;
}

/// **🔹 Show Loading Dialog**
void showLoadingDialog(BuildContext context, {String message = "Loading..."}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 16),
            Text(message),
          ],
        ),
      );
    },
  );
}

/// **🔹 Show Alert Dialog**
void showAlertDialog({
  required BuildContext context,
  required String title,
  required String message,
  VoidCallback? onConfirm,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              if (onConfirm != null) onConfirm();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}
