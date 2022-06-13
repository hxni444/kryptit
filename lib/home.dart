import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/message_encrpt.dart';

//simport 'package:packageandnavigation/message_encrpt.dart'
class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(60),
              child: const Text(
                "Krypt it!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50, fontFamily: 'Bold', color: Colors.black),
              ),
            ),
            backgroundColor: Colors.blue[200],
          ),
          // body: Body_shape(),
          body: SafeArea(
            child: Container(
              // width: double.maxFinite,
              //height: double.minPositive,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // MainAxisAlignment:   MainAxisAlignment.center,
                  const Text(
                    "Encryption Software",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "Select this icon to attach file",
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        //Icon(
                        // Icons.file_open_outlined,
                        //  size: 36.0,
                        //   //  print("get file");
                        // ),
                        IconButton(
                          onPressed: () {
                            print("select file");
                          },
                          icon: Icon(
                            Icons.file_open_rounded,
                            size: 36.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print("Udergo Compression and encryption");
                            },
                            child: Text('Compress & Enrypt'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              print("Encrypt only");
                            },
                            child: Text('Encrypt only'),
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        print("Decryption is intiated");
                      },
                      child: Text("Decrypt File")),
                  ElevatedButton(
                    onPressed: () {
                      // print("Text Encryption is started");
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) {
                          return txtencrypt();
                        }),
                      );
                    },
                    child: Text("Message Encryption"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
