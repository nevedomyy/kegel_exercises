import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'plugin.dart';


class KegelNotification extends StatefulWidget{
  @override
  _KegelNotification createState() => _KegelNotification();
}

class _KegelNotification extends State<KegelNotification>{
  List<String> _time = ['9','0','14','0','19','0'];
  List<Color> _colors = [
    Color.fromRGBO(46, 41, 78, 1),
    Color.fromRGBO(255, 212, 0, 1),
  ];

  @override
  initState() {
    super.initState();
    _init();
  }

  _init() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _time = pref.getStringList('_time') ?? ['9','0','14','0','19','0'];
    setState(() {});
  }

  _save() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setStringList('_time', _time);
    NotifPlugin();
    setState(() {});
  }

  Widget _w(BuildContext context, int number){
    return GestureDetector(
      onTap: (){
        showTimePicker(
          context: context,
          initialTime: TimeOfDay(hour: int.parse(_time[2*number]), minute: int.parse(_time[2*number+1])),
          builder: (BuildContext context, Widget child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                child: child);
          },
        ).then((value){
          if(value == null) return;
          _time[2*number] = value.hour.toString();
          _time[2*number+1] = value.minute.toString();
          _save();
        });
      },
      child: Text(
        DateFormat.Hm().format(DateTime(2019, 31, 5, int.parse(_time[2*number]), int.parse(_time[2*number+1]))),
        style: TextStyle(color: _colors[0], fontSize: 70.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Material(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Text(
                  'Напоминание',
                  style: TextStyle(color: _colors[0], fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _w(context, 0),
                      _w(context, 1),
                      _w(context, 2),
                    ],
                  )
                ),
              ),
              Center(
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.elliptical(25.0, 25.0)),
                    highlightColor: _colors[1],
                    onTap: (){Navigator.pop(context);},
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'закрыть',
                        style: TextStyle(color: _colors[0], fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}