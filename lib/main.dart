import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/page1.dart';
import 'package:flutterapp/page2.dart';
import 'package:flutterapp/page3.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';

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
    print(providerData.image);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(builder: (context) {
                  return ElevatedButton(
                    child: Text("Click me"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purpleAccent)),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Alert title"),
                              content: Text("This is content"),
                              actions: [
                                ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))
                              ],
                            );
                          });

                      //providerData.captureImage();
                    },
                  );
                }),
              ],
            ),
          )),
        ));
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
