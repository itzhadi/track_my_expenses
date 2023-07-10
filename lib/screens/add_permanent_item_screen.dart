import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddIPerItemScreen extends StatelessWidget {
  AddIPerItemScreen({this.color, this.descBtn});
  final Color? color;
  final String? descBtn;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                maxLength: 6,
                autofocus: false,
                onChanged: (value) {},
                style: TextStyle(color: Colors.black38, fontSize: 25),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(),
                  hintText: " הכנס סכום",
                  hintStyle: TextStyle(color: Colors.black38),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              TextField(
                maxLength: 30,
                onChanged: (value) {},
                style: TextStyle(color: Colors.black38, fontSize: 25),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(),
                  hintText: " הכנס תיאור",
                  hintStyle: TextStyle(color: Colors.black38),
                ),
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: MaterialButton(
                  child: Text(descBtn!,
                      style: TextStyle(color: Colors.black38, fontSize: 25)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  color: color,
                  onPressed: () {
                    //getTaskTitle!(task);
                    // Provider.of<TaskData>(context, listen: false).addTask(
                    //   task!,
                    // );
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
