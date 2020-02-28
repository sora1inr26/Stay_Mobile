import 'package:flutter/material.dart';

class Page extends StatelessWidget {
  final String title;

  const Page(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text(title);

    return Container(
      child: Center(
          child: FlatButton(
              onPressed: () => _openDetailsPage(context), child: text)),
    );
  }

  //Use the navigator like you usually do with .of(context) method
  _openDetailsPage(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

//  _openDetailsPage(BuildContext context) => mainNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

}

class DetailsPage extends StatelessWidget {
  final String title;

  const DetailsPage(this.title) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    final text = Text('Details of $title');
    return Container(
      child: Center(child: text),
    );
  }
}
