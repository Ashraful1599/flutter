import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/page1.dart';
import 'package:flutterapp/page2.dart';
import 'package:flutterapp/page3.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ReceiveData(),
    //  builder: (Context) => ReceiveData(),
    child: const PageViewClass(),
  ));
}

class PageViewClass extends StatefulWidget {
  const PageViewClass({Key? key}) : super(key: key);

  @override
  State<PageViewClass> createState() => _PageViewState();
}

class _PageViewState extends State<PageViewClass> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var _currentIndex = 0;
  final pages = [
    Page1(),
    Page2(),
    Page1(),
    Page3(),
  ];
  // var countno = 0;
  // count() {
  //   setState(() {
  //     countno++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<ReceiveData>(context);
  //  print(providerData.image);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blueAccent,
            items: <Widget>[
              Icon(Icons.add, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.compare_arrows, size: 30),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          body: Container(
              color: Colors.blueAccent,
              child: pages[_currentIndex],
          ),
        )));
  }

  Widget contactDetails(name, des) {
    return ListTile(
      title: Text(name),
      subtitle: Text(des),
      leading: CircleAvatar(
        child: Text(name[0]),
      ),
    );
  }
}

class ReceiveData extends ChangeNotifier {
  File? image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future captureImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // setState(() {
      image = File(pickedImage!.path);
      // });
      print(image);
      notifyListeners();
    }
  }
}
