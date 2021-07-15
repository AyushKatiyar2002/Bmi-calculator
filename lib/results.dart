import 'package:flutter/material.dart';
import 'reusable_code.dart';
import 'const.dart';

class results extends StatelessWidget {
  results({required this.result,required this.bmi,required this.statement});
  final String result;
  final String bmi;
  final  String statement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 55.0),
            child: Text('BMI'),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                child: Text(
                  'Your Results',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusablecode(
              colour: kActiveColor,
              codeChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toUpperCase(),style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff24d876),
                    fontSize: 30.0,
                  ),),
                  Text(bmi,style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:100.0,
                  ),),
                  Text(statement,style: TextStyle(fontSize: 22.0),
                  textAlign: TextAlign.center,),

                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
             Navigator.pop(context);

            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFEB1155),
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.only(top: 10.0),

              height: 80.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  'RE-CALCULATE',
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
    );
  }
}
