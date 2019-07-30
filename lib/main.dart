import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '手势Demo',
    home: new MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items =
      new List<String>.generate(30, (i) => '列表项${i + 1}');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('滑动删除Demo'),
          //title: new Text('按下手势Demo'),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return new Dismissible(
                key: new Key(item),
                onDismissed: (direction){
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('$item被删除了')));
                },
                child: new ListTile(
                  title: new Text('$item'),
                ),
            );
          },
        )
        //new Center(
        //child: new MyButton(),
        //),
        );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(content: new Text('按下'));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: new Container(
        padding: new EdgeInsets.all(10.0),
        decoration: new BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: new BorderRadius.circular(10.0),
        ),
        child: new Text('测试按钮'),
      ),
    );
  }
}
