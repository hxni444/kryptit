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
            decoration:const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter the hint to remember',
                ),
            
          ),
          ElevatedButton(
            onPressed: () {
              addonbuttonactionclick();
            },
            child: Text("Store and veiw"),
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
    int _id = 1;
    if (message.isEmpty || _hint.isEmpty) {
      return;
    }
    // print("$message,$_hint");
    final model = messagemodel(message: message, hint: _hint);
    _id = _id + 1;
    addmessage(model);
  }
}
