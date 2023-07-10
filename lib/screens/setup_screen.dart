import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:track_my_expenses/screens/add_permanent_item_screen.dart';
import 'package:track_my_expenses/utils/constants.dart';

import '../components/income_outcome_flt_btn.dart';
import 'home_screen.dart';

class Setup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text(
                      "הגדרות ראשוניות",
                      style: kText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox.fromSize(size: Size.fromHeight(45.0)),
                  TextField(
                    maxLength: 6,
                    style: TextStyle(color: Colors.black38, fontSize: 25),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(),
                      hintText: " הכנס משכורת",
                      hintStyle: TextStyle(color: Colors.black38),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                  SizedBox.fromSize(size: Size.fromHeight(40.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          // InOutFltBtn(
                          //     color: Color(0xFFC0F0A5),
                          //     heroTag: 'incomeBtn',
                          //     function: () {}),
                          AddPerItemFrame(
                              color: Color(0xFFC0F0A5),
                              heroTag: 'incomeBtn',
                              descBtn: 'הוסף הכנסה קבועה'),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "הכנסה קבועה",
                              style: TextStyle(color: Colors.black38),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          AddPerItemFrame(
                              color: Color(0XFFFFB4AB),
                              heroTag: 'outcomeBtn',
                              descBtn: 'הוסף הוצאה קבועה'),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("הוצאה קבועה",
                                style: TextStyle(color: Colors.black38)),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox.fromSize(size: Size.fromHeight(55.0)),
                  Text(
                    "תוכלו לערוך הגדרות אלו בכל שלב",
                    style: kTextSetUp_13,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox.fromSize(
                    size: Size.fromHeight(55),
                  ),
                  IconButton(
                    iconSize: 100,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                    icon: Icon(Icons.navigate_next),
                    color: Colors.black38,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddPerItemFrame extends StatelessWidget {
  const AddPerItemFrame({this.color, this.heroTag, this.descBtn});

  final Color? color;
  final String? heroTag;
  final String? descBtn;
  @override
  Widget build(BuildContext context) {
    return InOutFltBtn(
        color: color,
        heroTag: heroTag,
        function: () => {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).viewInsets.top),
                    child: AddIPerItemScreen(color: color, descBtn: descBtn),
                  ),
                ),
              )
            });
  }
}
