import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui/home.dart';

class txtencrypt extends StatefulWidget {
  const txtencrypt({Key? key}) : super(key: key);

  @override
  State<txtencrypt> createState() => _txtencryptState();
}

class _txtencryptState extends State<txtencrypt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Message or Text Encryption")),
        body: SafeArea(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the message to be encrypted ',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
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
              const Text(
                "Encrytted code ",
                textAlign: TextAlign.left,
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
                      onPressed: () {},
                      icon: Icon(Icons.enhanced_encryption_rounded),
                      label: Text(
                        "Encrypt no key",
                      ),
                    ),
                  ],
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
