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
  String decryptedtext = "";
  var ciphervalue, dvalue;
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
    //print(data);
    encryptedtext = "";
    for (i = 0; i < data.length; i++) {
      int value = data.codeUnitAt(i);
      print("orginal value ");
      print(value);
      ciphervalue = value + key;
      if (ciphervalue > 122) {
        value = value - 26 + key;
      } else {
        value = value + key;
      }
      encryptedtext += String.fromCharCode(value);
      //  String oneAsString = 1.toString();
      //print(value);
      print("encrypted text");
      print(encryptedtext);
    }
  }

  void decrypt_mesage(int key1) async {
    //decryptedtext = "";
    for (i = 0; i < encryptedtext.length; i++) {
      int dvalue = encryptedtext.codeUnitAt(i);
      ciphervalue = dvalue - key;
      print("dvalue");
      print(dvalue);
      if (ciphervalue < 97) {
        dvalue = dvalue + 26 - key;
      } else {
        dvalue = dvalue - key;
      }
      print("$dvalue after decryption");
      decryptedtext += String.fromCharCode(dvalue);
    }
    print("decryption completed");
    print(decryptedtext);
  }

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
                  hintText: 'Enter the message to be encrypted in alphabets ',
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
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
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
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          decryptedtext = "";
                          // key = _keycontrol.text;
                          //   data = _keycontrol.text;
                          setState(() {
                            decrypt_mesage(key);
                          });
                        },
                        icon: Icon(Icons.enhanced_encryption_rounded),
                        label: Text("Decrypt"),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),
              Text(
                "encypted message",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                width: 240.0,
                height: 42.0,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(24.0),
                  border: Border.symmetric(),
                  color: const Color(0xff2c2c2c),
                ),
                child: SizedBox(
                  child: Text(
                    encryptedtext,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: Colors.white,
                      height: 2,
                    ),
                  ),
                ),
              ),
              Text(
                "Decrypted message",
                style: TextStyle(fontSize: 20),
              ),
              // SizedBox.fromSize(size: 10),
              Container(
                width: 240.0,
                height: 42.0,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(24.0),
                  border: Border.symmetric(),
                  color: const Color(0xff2c2c2c),
                ),
                child: SizedBox(
                  child: Text(
                    decryptedtext,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: Colors.white,
                      height: 2,
                    ),
                  ),
                ),
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
