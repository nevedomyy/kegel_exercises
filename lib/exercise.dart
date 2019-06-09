import 'package:flutter/material.dart';
import 'dart:async';
import 'kegel.dart';


class Exercise extends StatefulWidget{
  @override
  _Exercise createState() => _Exercise();
}

class _Exercise extends State<Exercise>{
  List<Color> _colors = [
    Color.fromRGBO(46, 41, 78, 1),
    Color.fromRGBO(255, 212, 0, 1),
    Color.fromRGBO(238, 99, 82, 1),
    Color.fromRGBO(62, 160, 96, 1)
  ];
  Color _color;
  String _text;
  int _count;
  bool _tap;
  bool _level = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init(){
    _count = 10;
    _color = _colors[1];
    _text = 'старт';
    _tap = false;
    _level = !_level;
  }

  _timer1() async{
    if(_tap) return;
    _tap = true;
    _color = _colors[3];
    Timer.periodic(Duration(seconds: 1), (Timer timer){
      _color = _color == _colors[2] ? _colors[3] : _colors[2];
      if(_color == _colors[3])_count--;
      _text = _count.toString();
      if(_count == -1) {
        timer.cancel();
        _init();
        RootWidget.of(context).state.changeLevel();
      }
      setState(() {});
    });
  }

  _timer2() async{
    if(_tap) return;
    _tap = true;
    _color = _colors[2];
    Timer.periodic(Duration(seconds: 1), (Timer timer){
      if(_count > -1) _text = _count.toString();
      if(_count == -1) _color = _colors[3];
      _count--;
      if(_count == -3) {
        timer.cancel();
        _init();
        RootWidget.of(context).state.changeLevel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){_level ? _timer1() : _timer2();},
      child: Container(
        color: _color,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 120.0),
            child: Text(
              _text,
              style: TextStyle(color: Colors.white, fontSize: 50.0),
            ),
          ),
        ),
      ),
    );
  }
}