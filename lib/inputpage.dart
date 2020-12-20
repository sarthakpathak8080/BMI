import 'package:bmi_calculator/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_widget.dart';
import 'constants.dart';
import 'roundicon.dart';
import 'bmicalc.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reuablewidget(
                    onPress: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    cardChild: malefemalewidgets(
                      icon: FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                    colour: selectedgender == Gender.male
                        ? cardscolors
                        : inactivecardcolor,
                  ),
                ),
                Expanded(
                    child: Reuablewidget(
                  onPress: () {
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  cardChild: malefemalewidgets(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                  colour: selectedgender == Gender.female
                      ? cardscolors
                      : inactivecardcolor,
                ))
              ],
            ),
          ),
          Expanded(
              child: Reuablewidget(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: numberTextStyle),
                    Text("cm", style: labelTextStyle)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor:  Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    overlayColor: Color(0x29EB1555),
                    overlayShape: RoundSliderOverlayShape(overlayRadius:30.0),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0)),
                          
                  child: Slider( 
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  
                  ),
                )
              ],
            ),
            colour: cardscolors,
          )),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Reuablewidget(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT", style: labelTextStyle,),
                          Text(weight.toString(), style: numberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPress: (){
                                 setState(() {
                                   weight--;
                                 });
                               },
                             ),
                                SizedBox(width: 10.0,),
                                 RoundIconButton(
                                   onPress: (){
                                    setState(() {
                                      weight++;
                                    });
                                   },
                               icon: FontAwesomeIcons.plus,
                             ), 
                            ],
                          )
                        ],
                      ),
                  colour: cardscolors,
                )),
                Expanded(
                    child: Reuablewidget(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("AGE", style: labelTextStyle,),
                          Text(age.toString(), style: numberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                               RoundIconButton(
                                   onPress: (){
                                    setState(() {
                                      age--;
                                    });
                                   },
                               icon: FontAwesomeIcons.minus,
                             ),
                              SizedBox(width:10.0),
                               RoundIconButton(
                                   onPress: (){
                                    setState(() {
                                      age++;
                                    });
                                   },
                               icon: FontAwesomeIcons.plus,
                             ),
                            ]
                           
                          )
                        ],
                      ),
                  colour: cardscolors,
                ))
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              BmiCalculator calc = BmiCalculator(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiresult: calc.calcbmi(),
                resultText: calc.getResult(),
                interpretation: calc.getinterpretation(),
              ),));
            },
                      child: Container(
                        padding: EdgeInsets.only(bottom:15),
              color: bottomcontainercolor,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: bottomcontainerheight,
              child: Center(child: Text('CALCULATE', style: TextStyle(fontSize:30, fontWeight: FontWeight.bold),)),
            ),
          )
        ],
      ),
    );
  }
}


