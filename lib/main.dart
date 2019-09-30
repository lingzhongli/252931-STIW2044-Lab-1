import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget>createState(){
  return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  double height, weight , bmr ,result ;
  int age;

  final TextEditingController _acontroller = TextEditingController();
  final TextEditingController _bcontroller = TextEditingController();
  final TextEditingController _ccontroller = TextEditingController();

  var _gender = ['Male','Female'];
  var _formula = ['Mifflin-St Jeor (default)','Harris-Benedict'];
  var _activity=['Sedentary(litter or no execrise)','Light active(1-3 day per week)','Moderately active(3-5 day per week)','Very active(6-7 day per week)','Super active(very hard execrise)'];

  var _currentItemSelectedgender = 'Male';
  var _currentItemSelectedformula = 'Mifflin-St Jeor (default)';
  var _currentItemSelectedactivity = 'Sedentary(litter or no execrise)';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMR Application'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              
              Text(" Gender  ",style: new TextStyle(fontSize: 20.0, color: Colors.black)),
              DropdownButton<String>(
                items: _gender.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),

                onChanged: (String newValueSelected) {
                  setState((){
                    this._currentItemSelectedgender = newValueSelected;

                  });
                },
                value: _currentItemSelectedgender,
              ),

              Text("  Equation ",style: new TextStyle(fontSize: 20.0, color: Colors.black)),
              DropdownButton<String>(
                items: _formula.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),

                onChanged: (String newValueSelected) {
                  setState((){
                    this._currentItemSelectedformula = newValueSelected;

                  });
                },
                value: _currentItemSelectedformula,
              ),
              
              Text("  Activity Level ",style: new TextStyle(fontSize: 20.0, color: Colors.black)),
               DropdownButton<String>(
                items: _activity.map((String dropDownStringItem){
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),

                onChanged: (String newValueSelected) {
                  setState((){
                    this._currentItemSelectedactivity = newValueSelected;

                  });
                },
                value: _currentItemSelectedactivity,
              ),


              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: "Age",

                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _acontroller,
              ),
            ),

              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                  decoration: InputDecoration(
                  hintText: "Height(cm)",

                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _bcontroller,
              ),
            ),

            Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: TextField(
                  
                  decoration: InputDecoration(
                  hintText: "Weight(kg)",

                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _ccontroller,
              ),
            ),

            MaterialButton( //NEW
              minWidth: 300,
              child: Text('Calculate BMR'),
              color: Colors.black,
              textColor: Colors.white,
              elevation: 15,
              onPressed: _onPress,
            ),
            SizedBox(
            height: 10,
              ),
              Text("BMR: $bmr"),
              Text(""),
              Text("Maintenance $result calories per day"),

              

                

            ],
          ),
        ),
      ),
    );
  }

  
  void _onPress() {
  setState((){
    age = int.parse(_acontroller.text);
    height = double.parse(_bcontroller.text);
    weight = double.parse(_ccontroller.text);

    if( _currentItemSelectedgender.contains("Male") && _currentItemSelectedformula.contains("Mifflin-St Jeor (default)"))
    {
    bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;

    if(_currentItemSelectedactivity.contains("Sedentary(litter or no execrise)")){
        result=bmr * 1.2 ;
        
    }
    else if(_currentItemSelectedactivity.contains("Light active(1-3 day per week)")){
        result=bmr*1.375;
    }
    else if(_currentItemSelectedactivity.contains("Moderately active(3-5 day per week)")){
        result=bmr*1.55;
    }
    else if(_currentItemSelectedactivity.contains("Very active(6-7 day per week)")){
        result=bmr*1.725;
    }

    else{
      result=bmr*1.9;
    }

    }

    else if( _currentItemSelectedgender.contains("Female") && _currentItemSelectedformula.contains("Mifflin-St Jeor (default)"))
    {
    bmr = (10 * weight) + (6.25 * height ) - (5 * age) - 161;
    if(_currentItemSelectedactivity.contains("Sedentary(litter or no execrise)")){
        result=bmr*1.2;
    }
    else if(_currentItemSelectedactivity.contains("Light active(1-3 day per week)")){
        result=bmr*1.375;
    }
    else if(_currentItemSelectedactivity.contains("Moderately active(3-5 day per week)")){
        result=bmr*1.55;
    }
    else if(_currentItemSelectedactivity.contains("Very active(6-7 day per week)")){
        result=bmr*1.725;
    }

    else{
      result=bmr*1.9;
    }
    
    }

    else if( _currentItemSelectedgender.contains("Male") && _currentItemSelectedformula.contains("Harris-Benedict"))
    {
    bmr = 66.47 + ( 13.75 * weight  ) + ( 5.003 * height  ) - ( 6.755 * age  );
    if(_currentItemSelectedactivity.contains("Sedentary(litter or no execrise)")){
        result=bmr*1.2;
    }
    else if(_currentItemSelectedactivity.contains("Light active(1-3 day per week)")){
        result=bmr*1.375;
    }
    else if(_currentItemSelectedactivity.contains("Moderately active(3-5 day per week)")){
        result=bmr * 1.55;
    }
    else if(_currentItemSelectedactivity.contains("Very active(6-7 day per week)")){
        result=bmr*1.725;
    }

    else{
      result=bmr*1.9;
    }
    
    }

    else 
    {
    bmr = 655.1 + ( 9.563 * weight ) + ( 1.85 * height ) - ( 4.676 * age );
    if(_currentItemSelectedactivity.contains("Sedentary(litter or no execrise)")){
        result=bmr*1.2;
    }
    else if(_currentItemSelectedactivity.contains("Light active(1-3 day per week)")){
        result=bmr*1.375;
    }
    else if(_currentItemSelectedactivity.contains("Moderately active(3-5 day per week)")){
        result=bmr*1.55;
    }
    else if(_currentItemSelectedactivity.contains("Very active(6-7 day per week)")){
        result=bmr*1.725;
    }

    else{
      result=bmr*1.9;
    }
    
    }

  });
}
}