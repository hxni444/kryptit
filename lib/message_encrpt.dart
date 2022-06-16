import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui/home.dart';

class txtencrypt extends StatefulWidget {
  txtencrypt({Key? key}) : super(key: key);

  @override
  State<txtencrypt> createState() => _txtencryptState();
}

class _txtencryptState extends State<txtencrypt> {
  @override
  final _textcontrol = TextEditingController();
  final _keycontrol = TextEditingController();
  String data = "intial data";
  int key = 2;
  int value = 0;
  int i = 0;
  String encryptedtext = "";
  void encrypt_message(int key1) async {
    //final key = encrypt.Key.;
    //final iv = encrypt.IV.fromSecureRandom(16);
    //final Encrypter = encrypt.Encrypter(encrypt.AES(key));
    //final encrypted = Encrypter.encrypt(data, iv: iv);
    //final decrypted = Encrypter.decrypt(encrypted, iv: iv);
    //print(decrypted);
    //print(encrypted.bytes);
    //print(encrypted.base16);
    //print(encrypted.base64);
    //encryptedtext = encrypted.bytes.toString();
    print(data);
    for (i = 0; i < data.length; i++) {
      int value = data.codeUnitAt(i);
      print("orginal value ");
      print(value);
      if (value + key >= 90) {
        value = value - 26 + key;
      } else {
        value = value + key;
      }
      encryptedtext += String.fromCharCode(value);
      //  String oneAsString = 1.toString();
      //print(value);
      print(encryptedtext);
    }
  }

  void decrypt_mesage() {}
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Message or Text Encryption")),
        body: SafeArea(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: _textcontrol,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the message to be encrypted ',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Enter the Key (optional) ",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              TextField(
                controller: _keycontrol,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the key to encrpt',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // key = _keycontrol.text;
                        //   data = _keycontrol.text;
                      },
                      icon: Icon(Icons.enhanced_encryption_rounded),
                      label: Text("Encrypt with key"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        data = _textcontrol.text;
                        setState(() {
                          // print(data);
                          encryptedtext = " ";
                          encrypt_message(key);
                        });
                      },
                      icon: Icon(Icons.enhanced_encryption_rounded),
                      label: Text(
                        "Encrypt no key",
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                "Encrytted code ",
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              Text(
                encryptedtext,
                style: TextStyle(fontSize: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) {
                        return Home_screen();
                      },
                    ),
                  );
                },
                child: Text(
                  'Go back!',
                ),
              )
            ],
          ),
        )));
  }
}
