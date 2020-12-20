import 'package:bmi_calculator/inputpage.dart';
import 'package:flutter/material.dart';
import 'reusable_widget.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiresult,@required this.resultText,@required this.interpretation});

  final String bmiresult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              width: 500,
              child: Text(
                'Your Result',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                flex: 5,
                child: Reuablewidget(
                  colour: cardscolors,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        resultText.toUpperCase(),
                        style: TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(bmiresult ,
                      style: TextStyle(fontSize:100, fontWeight: FontWeight.bold),
                      ),
                      Text(interpretation, style: TextStyle(fontSize:22),textAlign: TextAlign.center,)
                    ],
                  ),
                )),
            GestureDetector(
              onTap: () {
               Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 15),
                color: bottomcontainercolor,
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomcontainerheight,
                child: Center(
                    child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ));
  }
}
