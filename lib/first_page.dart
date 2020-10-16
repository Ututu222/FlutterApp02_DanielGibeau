import 'package:flutter/material.dart';

class MyFirstPage extends StatefulWidget {
  @override
  _MyFirstPageState createState() => _MyFirstPageState();
}

class _MyFirstPageState extends State<MyFirstPage> {
  bool _enabled = false;
  String _msg1 = '', _msg2 = '';
  int _counter = 0;

  void clickMeAction() {
    setState(() {
      _counter++;
      _msg1 = 'Clicked $_counter times';
    });
  }

  void resetAction() {
    setState(() {
      _counter = 0;
      _msg1 = 'Click me';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Functionality Demo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('enable functionality'),
                Switch(
                    value: _enabled,
                    onChanged: (bool onChangedValue) {
                      _enabled = onChangedValue;
                      setState(() {
                        if (_enabled) {
                          if (_counter == 0) {
                            _msg1 = 'Click me';
                          } else {
                            _msg1 = 'Clicked $_counter times';
                          }
                          _msg2 = 'Reset';
                        } else {
                          _msg1 = '';
                          _msg2 = '';
                        }
                      });
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.redAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: _enabled ? clickMeAction : null,
                    child: Text(_msg1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 8,
                    textColor: Colors.red.shade100,
                    color: Colors.blueAccent,
                    highlightColor: Colors.blue,
                    splashColor: Colors.green.shade300,
                    padding: EdgeInsets.all(20.0),
                    onPressed: _enabled ? resetAction : null,
                    child: Text(_msg2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
