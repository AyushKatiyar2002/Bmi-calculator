import 'package:bmi_calculator/const.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_code.dart';
import 'icon.dart';
import 'results.dart';
import 'brain.dart';


enum Gender { male, female }

Gender? check;

class bodypage extends StatefulWidget {
  @override
  _State createState() => _State();
}

int height = 180;
int weight = 60;
int age = 18;

class _State extends State<bodypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI')),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          check = Gender.male;
                        });
                      },
                      child: Reusablecode(
                        colour:
                            check == Gender.male ? kActiveColor : kinActiveColor,
                        codeChild: iconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          check = Gender.female;
                        });
                      },
                      child: Reusablecode(
                        colour: check == Gender.female
                            ? kActiveColor
                            : kinActiveColor,
                        codeChild: iconContent(
                            icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                child: Reusablecode(
                  colour: kActiveColor,
                  codeChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: klabelStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: knumberStyle,
                          ),
                          Text(
                            'cm',
                            style: klabelStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xffeb1555),
                          overlayColor: Color(0x29eb1555),
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Reusablecode(
                        colour: kActiveColor,
                        codeChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: klabelStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: knumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIcon(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                RoundIcon(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Reusablecode(
                        colour: kActiveColor,
                        codeChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: klabelStyle,
                            ),
                            Text(
                              age.toString(),
                              style: knumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIcon(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                RoundIcon(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  brain calc=brain(height:height,weight:weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => results(bmi: calc.calculateBmi(),result: calc.check(),statement: calc.statement(),),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFEB1155),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 80.0,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: klabelStyle.copyWith(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({required this.icon, required this.onPressed});
  final IconData? icon;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}
