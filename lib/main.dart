import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/page1.dart';
import 'package:flutterapp/page2.dart';
import 'package:flutterapp/page3.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ReceiveData(),
    //  builder: (Context) => ReceiveData(),
      child: const PageViewClass(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
//   }
// }
//
// class HomePage extends StatelessWidget {
//   // const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: Scaffold(
//           floatingActionButton: FloatingActionButton(
//             child: Icon(
//               Icons.add,
//               size: 30,
//             ),
//             onPressed: () {
//               print("Clicked");
//             },
//           ),
//           backgroundColor: Colors.deepPurpleAccent,
//           appBar: AppBar(
//             title: const Text("This is a title"),
//             centerTitle: true,
//             leading: const Icon(Icons.menu, size: 30),
//             actions: [
//               IconButton(
//                 icon: Icon(
//                   Icons.add_circle_outline,
//                   size: 30,
//                 ),
//                 onPressed: () {
//                   print('e');
//                 },
//               )
//             ],
//           ),
//           body: Row(
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: Colors.yellowAccent,
//                   )),
//               Expanded(
//                   flex: 1,
//                   child: Container(
//                     color: Colors.red,
//                   )),
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: Colors.black,
//                   )),
//             ],
//           )),
//     );
//   }
// }

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

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You clicked " + providerData.value.toString() + " times"),
            ElevatedButton(
              child: Text("Click me"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.purpleAccent)),
              onPressed: () {
                providerData.increase();
              },
            )
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
  int value = 0;
  increase() {
    value++;
    notifyListeners();
  }
}
