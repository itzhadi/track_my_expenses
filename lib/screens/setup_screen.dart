import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:track_my_expenses/utils/constants.dart';

import '../components/income_outcome_flt_btn.dart';

class Setup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "הגדרות ראשניות",
                style: kText,
                textAlign: TextAlign.center,
              ),
              SizedBox.fromSize(size: Size.fromHeight(55.0)),
              TextField(
                style: TextStyle(color: Colors.black38, fontSize: 25),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(),
                  hintText: " הכנס משכורת",
                  // label: Text("משכורת",
                  //     style: TextStyle(
                  //       color: Colors.black38,
                  //     )),
                  hintStyle: TextStyle(color: Colors.black38),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
              SizedBox.fromSize(size: Size.fromHeight(55.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InOutFltBtn(color: Color(0xFFC0F0A5), function: () {}),
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
                      InOutFltBtn(color: Color(0XFFFFB4AB), function: () {}),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("הוצאה קבועה",
                            style: TextStyle(color: Colors.black38)),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
