import 'package:flutter/material.dart';
import 'Pages/OrderPages/OrderMain.dart';
import 'Pages/GoodsPages/GoodsMain.dart';
import 'Pages/CommPages/CommMain.dart';
import 'Pages/UserPages/UserMain.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _BottomNavigationColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list
      ..add(OrderMain())
      ..add(GoodsMain())
      ..add(CommMain())
      ..add(UserMain());
    super.initState(); //无名无参需要调用
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //脚手架
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _BottomNavigationColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(color: _BottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_grocery_store,
                color: _BottomNavigationColor,
              ),
              title: Text(
                '商城',
                style: TextStyle(color: _BottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: _BottomNavigationColor,
              ),
              title: Text(
                '讨论',
                style: TextStyle(color: _BottomNavigationColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _BottomNavigationColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _BottomNavigationColor),
              )),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}