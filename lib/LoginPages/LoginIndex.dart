import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'STAY',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('登陆'),
        ),
        body: new Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                      Text('STAY陪伴左右',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),

              SizedBox(height: 120),
              new inputEdtextNameWiget(),
              SizedBox(height: 20,),
              new inputEdtextPassWordWiget(),
              SizedBox(height: 30,),
              new loginButtonWiget(),
              SizedBox(height: 300,),
              new regButtonWiget(),
            ],
          )
        ),
      ),
    );
  }
}

String userName;
String password;

class inputEdtextNameWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 300,
      child: new Container(
        padding: EdgeInsets.fromLTRB(20, 2, 8, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black12,
        ),
        alignment: Alignment.center,
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            hintText: '用户名',
            border: InputBorder.none,
          ),
          onChanged: (value){
              userName = value;
          },
        ),
      ),
    );
  }
}

//输入密码
class inputEdtextPassWordWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 300,
      child: new Container(
        padding: EdgeInsets.fromLTRB(20, 2, 8, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black12,
        ),
        alignment: Alignment.center,
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            
            hintText: '密码',
            border: InputBorder.none,
            
          ),
          obscureText: true,

          onChanged: (value){
              password = value;
          },
        ),
      ),
    );
  }
}

ShapeBorder buttonShape = const RoundedRectangleBorder
(
  side: BorderSide.none,
  borderRadius: BorderRadius.all(Radius.circular(30))
);

//登录按钮
class loginButtonWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 300,
        child: new Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
          ),
          //alignment: Alignment.center,
          //padding: EdgeInsets.fromLTRB(2, 15, 2, 15),


          child: RaisedButton(
            shape: buttonShape,
            color: Colors.blue,
            child: Text(
              '登录',
              textAlign: TextAlign.center,
              style: TextStyle(letterSpacing: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white70),
            ), onPressed: () {
              login();
            }, 
          )
        ), 


    );
  }
}

class regButtonWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 300,
      child: new Container(
        padding: EdgeInsets.fromLTRB(2, 15, 2, 15),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(30),
          color: Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          '还没有账户，点击这里注册',
          textAlign: TextAlign.center,
          style: TextStyle(letterSpacing: 5,
          fontWeight: FontWeight.bold,
          color: Colors.grey),
        )
      ),
    );
  }
}

void login() async{
  print("用户名" + userName + "密码" + password);

    // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url = 'http://192.168.50.165/Test/Info';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}