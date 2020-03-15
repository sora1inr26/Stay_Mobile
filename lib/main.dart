import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stay/Models/EnumData.dart' as enumData;

import 'Pages/LoginPages/LoginIndex.dart';
import 'bottom.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


//void main() => runApp(MyApp());
void main(){
  //if (token.isNotEmpty){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  String token = 'stay1';

  @override
  Widget build(BuildContext context) {
    getUserToken();
    //print(token);

    //token empty or notempty
    if (token != 'stay') {
        return new MaterialApp(
          
          title: 'Flutter',
          
          home: MyHomePage()
      );
    }else{
        return new MaterialApp(
        title: 'Flutter',
        home: LoginIndex()
      );
    }
  }

  void getUserToken() async{
    SharedPreferences prefs = await _prefs;
    String keyName = (enumData.localProp.userToken.toString());
    String strValue = prefs.getString(keyName); 
    //print(strValue);
    token = strValue;
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),//主题
      home: BottomNavigationWidget(),
    );
  }
}