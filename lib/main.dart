import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() => runApp(
  MaterialApp(
    home: MyApp(),
  ),
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

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
        Icon(Icons.error),
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
      gravity: ToastGravity.CENTER,
      toastDuration: Duration(seconds: 2),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  String selected = "Item 1";
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Toasts"),
      ),
      body: Center(
        child: Column(
          children: [
              // DropdownButton(
              //     value: selected,
              //     icon: Icon(Icons.arrow_drop_down),
              //     items: items.map((String item){
              //       return DropdownMenuItem(child: Text(item),value: item,);
              //     }).toList(),
              //     onChanged: (String? val){
              //       setState(() {
              //         selected = val!;
              //       });
              //     })
            Row(
              children: [
                Expanded(
                  child: DropdownSearch<int>(
                    items: [1, 2, 3, 4, 5, 6, 7],
                  ),
                ),
                Padding(padding: EdgeInsets.all(4)),
                Expanded(
                  child: DropdownSearch<int>.multiSelection(
                    clearButtonProps: ClearButtonProps(isVisible: true),
                    items: [1, 2, 3, 4, 5, 6, 7],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}