import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';

import 'LoginPages/LoginIndex.dart';
import 'navi.dart';

var token ='';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //token empty or notempty
    if (token.isEmpty) {
        return new MaterialApp(
          
          title: 'Flutter',
          
          home: MyHomePage()
      );
    }else{
        return new MaterialApp(
        title: 'Flutter',
        home: LoginIndex() //MyHomePage()
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Page _page = Page('Page 0');
  int _currentIndex = 0;

  // Custom navigator takes a global key if you want to access the
  // navigator from outside it's widget tree subtree
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  new AppBar(
        title: new Text('Welcome to Flutter'),),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        onTap: (index) {
          // here we used the navigator key to pop the stack to get back to our
          // main page
          navigatorKey.currentState.maybePop();
          setState(() => _page = Page('Page $index'));
          _currentIndex = index;
        },
        currentIndex: _currentIndex,
      ),
      body: CustomNavigator(
        navigatorKey: navigatorKey,
        home: _page,
        //Specify your page route [PageRoutes.materialPageRoute] or [PageRoutes.cupertinoPageRoute]
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }

  final _items = [
    BottomNavigationBarItem
    (
      icon: Icon(Icons.home), title: Text('主页') 
    ),
    BottomNavigationBarItem
    (
      icon: Icon(Icons.message), title: Text('交流')
    ),
    BottomNavigationBarItem
    (
        icon: Icon(Icons.perm_identity), title: Text('我')
    ),
  ];
}


