import 'package:flutter/material.dart';

void main() {
  runApp(MyPointerExample());
}

class MyPointerExample extends StatefulWidget {
  @override
  _MyPointerExampleState createState() => _MyPointerExampleState();
}

class _MyPointerExampleState extends State<MyPointerExample> {
  bool _ignoring = false;
  bool _absorbing = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pointer Example",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pointers Example'),
        ),
        body: Container(
          child: Column(
            children: [
              IgnorePointer(
                ignoring: _ignoring,
                child: FlatButton(
                  child: Text('Click me'),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("you pressed me..")),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Want to Ignore the button?'),
                  Switch(
                      value: _ignoring,
                      onChanged: (bool value) {
                        setState(() {
                          _ignoring = value;
                        });
                      }),
                ],
              ),
              AbsorbPointer(
                absorbing: _absorbing,
                child: FlatButton(
                  child: Text('Press me'),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("you pressed me..")),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Want to absorb the button?'),
                  Switch(
                      value: _absorbing,
                      onChanged: (bool value) {
                        setState(() {
                          _absorbing = value;
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
