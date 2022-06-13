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
  String data = "intial data";

  String encryptedtext = "__________";
  void encrypt_message() async {
    final key = encrypt.Key.fromSecureRandom(32);
    final iv = encrypt.IV.fromSecureRandom(16);
    final Encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = Encrypter.encrypt(data, iv: iv);
    final decrypted = Encrypter.decrypt(encrypted, iv: iv);
    print(decrypted);
    print(encrypted.bytes);
    print(encrypted.base16);
    print(encrypted.base64);
    encryptedtext = encrypted.bytes.toString();
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
                      onPressed: () {},
                      icon: Icon(Icons.enhanced_encryption_rounded),
                      label: Text("Encrypt with key"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        data = _textcontrol.text;
                        print(data);
                        encrypt_message();
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
