import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ui/db/model/data_model.dart';
import 'package:ui/db/model/funtions/db_functions.dart';
import 'package:ui/message_encrpt.dart';

class waddmessage extends StatelessWidget {
  waddmessage({Key? key}) : super(key: key);
  final _hintcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: _hintcontroller,
          ),
          ElevatedButton(
            onPressed: () {
              addonbuttonactionclick();
            },
            child: Text("Store"),
          )
        ],
      ),
    );
  }

  Future<void> addonbuttonactionclick() async {
    print("button click function intiated");
    final message = gencrypt;
    print(gencrypt);
    final _hint = _hintcontroller.text;
    if (message.isEmpty || _hint.isEmpty) {
      return;
    }
   // print("$message,$_hint");
    final model = messagemodel(message: message, hint: _hint);
    addmessage(model);
  }
}
