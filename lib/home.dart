import 'dart:io' as io;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui/message_encrpt.dart';

//simport 'package:packageandnavigation/message_encrpt.dart'
class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  bool loading = false;

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  void _pickFile() async {
    // opens storage to pick files and the picked file or files
    // are assigned into result and if no file is chosen result is null.
    // you can also toggle "allowMultiple" true or false depending on your need
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    // if no file is picked
    if (result == null) return;

    // we will log the name, size and path of the
    // first picked file (if multiple are selected)
    print(result.files.first.name);
    print(result.files.first.size);
    print(result.files.first.path);
    final file = result.files.first;

    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
    print("opening file");
  }

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
                            print("Downloading Requested");
                            _pickFile();
                            //   Download_to();
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
