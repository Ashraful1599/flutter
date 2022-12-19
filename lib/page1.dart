import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(
          child:ElevatedButton(
            onPressed: (){
              showDialog(context: context, builder: (context){
              return  Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        child: Container(
                          height: 250,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Text("This is title",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("dialog contnet",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -50,
                          child: CircleAvatar(
                        radius: 50,
                        child: Icon(Icons.add_box_outlined),
                      ))
                    ],
                  ),
                );
              });
            },
            child: Text("Custom dialog box"),
          ),
        )
    );
  }
}
