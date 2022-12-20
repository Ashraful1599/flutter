import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastContext extends StatefulWidget {
  @override
  _ToastContextState createState() => _ToastContextState();
}

class _ToastContextState extends State<ToastContext> {
  late FToast fToast;

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.greenAccent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.check),
        SizedBox(
          width: 12.0,
        ),
        Text("This is a Custom Toast"),
      ],
    ),
  );

  _showToast() {
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }



  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(globalKey.currentState!.context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Toasts"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24.0,
            ),
            ElevatedButton(
              child: Text("Show Custom Toast"),
              onPressed: () {
                _showToast();
              },
            ),
          ],
        ),
      ),
    );
  }
}