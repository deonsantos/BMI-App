import 'dart:math';

import 'package:bmi_app/colors.dart';
import 'package:bmi_app/drawer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BmiCalculatorPage extends StatefulWidget {

  @override
  _BmiCalculatorPageState createState() => _BmiCalculatorPageState();
}

TextStyle textStyle = 
TextStyle(color: textColor,fontSize: 25, fontWeight: FontWeight.w700,   );
int age = 16;
int weight =20;
double height =0.0;
bool isActive =false;
double userBMI =0;
String bmiResults = "Results awaiting..";
class _BmiCalculatorPageState extends State<BmiCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: secondaryColor,
      centerTitle: true,
      title: Text("BMI Calculator"),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh), 
        onPressed: () {
          setState(() {
             age = 16;
                 weight = 20;
                 height = 0.0;
                 isActive = false;
                userBMI = 0;
                 bmiResults = "Results awaiting..";
                      
                    });
        },
        )
      ]
      ,),
      drawer: Drawer(
        child: DrawerContainer(),
      ),
      body: Container( 
        decoration:BoxDecoration(
          gradient:  LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             colors: [
               primaryColor,
               secondaryColor],

              ),
        ),
        child: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[Text(
            userBMI.toStringAsFixed(1), 
          style: textStyle.copyWith(fontSize: 60),
          ),
          Text(
            bmiResults,
          style: textStyle.copyWith(color:Color(0xffCABFDC), fontSize: 40 ),
          ),
          Divider(
            color: Color(0xffA99CC7),
            thickness: 1.5,
          ),
          Expanded(child:
          Row(
            
            children: [
              Expanded(child:
              reusableContainer(
                title: "Age", textStyle: textStyle,
                widget1: Text(age.toString(),
                style: textStyle.copyWith(color:Colors.white) , ),
                widget2: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                  
  chooseRange(icon: FontAwesomeIcons.minus, onTap: (){
    setState(() {
          age--;
        });
  }),
  chooseRange(icon: FontAwesomeIcons.plus, onTap: (){setState(() {
      age++;
    });}),
],)
                ),),
                  Expanded(child: 
                  reusableContainer(
                    title: "weight(kg)", 
                    textStyle: textStyle.copyWith(fontWeight: FontWeight.w500, ),
                     widget1: Text(weight.toString(),
                        style: textStyle.copyWith(color: Colors.white)
                        ),
widget2: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  
  chooseRange(icon: FontAwesomeIcons.minus, onTap: (){setState(() {
      weight--;
    });}),
  chooseRange(icon: FontAwesomeIcons.plus, onTap: (){setState(() {
      weight++;
    });}),
  
],)
                    )),
             
            ],
          )
          ),
          Expanded(
            child: reusableContainer(
              title: "Height", textStyle: textStyle,   
          widget1: Slider(value: height.toDouble(),
           
          onChanged: (value){
            setState(() {
            height =value.ceilToDouble();             
                        });
                        
          },
          min: 0,
          max: 500, 
          inactiveColor: textColor ,
          activeColor: buttonColor
          
          
          ),
          widget2:
          Text(height.toString(), style: textStyle.copyWith(fontSize:30)
           ),
        
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectGenderButton(
                  color: isActive?Colors.white:Colors.red,
                  onPressed: (){
                    setState(() {
                  isActive=false;
                                        });
                  }
                  ),
                Text(
                  "Female",
                  style: textStyle.copyWith(fontSize: 18),
                
                ),
                Spacer(),
                selectGenderButton(
                  color: isActive ? Colors.red : Colors.white,
                        onPressed: () {
                          setState(() {
                            isActive = true;
                          });
                        }
                ),
                Text(
                  "Male",
                  style: textStyle.copyWith(fontSize: 18),),
                  
            ],),
          ),
          Container(
            height: MediaQuery.of(context).size.height *0.11,
        padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              shape: StadiumBorder(),
              color: buttonColor,
              onPressed: (){
                double bmi= weight/pow(height/100, 2);
                setState(() {

                userBMI =bmi;   
                if(userBMI<18.0){
                  bmiResults="Underweight";
                }else if(userBMI>=18 && userBMI<24.9)       
                { bmiResults = "Normal weight";

                }else if (userBMI==25 && userBMI<=29.9){
                  bmiResults ="Overweight";

                }else {
                  bmiResults="obesity";
                }        
                                });
              },
              child: Text("CALCULATE YOUR BMI", 
              style: textStyle.copyWith(fontSize: 20) ,),
            ),
          ),
          ]
          
          ,),
        ),
        ),
    );
      
    
  }
}
reusableContainer({String title, Widget widget1,Widget widget2, textStyle,}){
  return Container(
    margin:EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      
      children: [

      Text(title, style: textStyle,),
      widget1,
      widget2,
    ],),
    decoration: BoxDecoration(
      color: containerColor,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
selectGenderButton({Function onPressed, Color color}){
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: 20,
height: 20,
decoration: BoxDecoration(color: color,
shape:BoxShape.circle
),
    ),
  );
}
chooseRange({icon,Function onTap}){
  return InkWell(
onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 45,
      height: 45,
      child: Center(child: Icon(icon),),
      decoration: BoxDecoration(  color:Color (0xff7E69A1),
      shape: BoxShape.circle),
    ),

  );
}