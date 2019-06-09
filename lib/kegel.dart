import 'package:flutter/material.dart';
import 'notification.dart';
import 'exercise.dart';
import 'plugin.dart';
import 'info.dart';
import 'arc.dart';

class Kegel extends StatefulWidget {
  @override
  _KegelState createState() => _KegelState();
}

class _KegelState extends State<Kegel> {
  List<Color> _colors = [
    Color.fromRGBO(46, 41, 78, 1),
    Color.fromRGBO(255, 212, 0, 1)
  ];
  List<String> _textHeaders = [
    'Упражнение 1\nна выносливость',
    'Упражнение 2\nна силу'
  ];
  List<String> _textExt = [
    'Займите удобную позицию. Эти упражнения можно делать в любом положении. Убедитесь, что мышцы ягодиц и живота расслаблены.\n\nСжимайте и разжимайте мышцы тазового дна в течении 1 секунды. Сделайте 10 быстрых сокращений.',
    'Займите удобную позицию. Эти упражнения можно делать в любом положении. Убедитесь, что мышцы ягодиц и живота расслаблены.\n\nСжимайте и удерживайте в этом состоянии мышцы тазового дна на протяжении 10 секунд. Затем расслабьте мышцы.',
  ];
  bool _level = false;

  @override
  initState() {
    super.initState();
    NotifPlugin();
  }

  changeLevel(){
    setState(() {
      _level = !_level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Material(
          child: RootWidget(
            this,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          !_level ? _textHeaders[0] : _textHeaders[1],
                          style: TextStyle(color: _colors[0], fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Info()
                          ));
                        },
                        highlightColor: _colors[1],
                        icon: Icon(Icons.info_outline, size: 30.0, color: _colors[0]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0),
                      child: IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => KegelNotification()
                          ));
                        },
                        highlightColor: _colors[1],
                        icon: Icon(Icons.notifications, size: 30.0, color: _colors[0]),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      !_level ? _textExt[0] : _textExt[1],
                      style: TextStyle(color: _colors[0], fontSize: 17.0),
                    ),
                  ),
                ),
                ClipPath(
                  clipper: KegelArc(),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200.0,
                    child: Exercise(),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}

class RootWidget extends InheritedWidget{
  final _KegelState state;

  RootWidget(this.state, child): super(child: child);

  static RootWidget of (BuildContext context){
    return context.inheritFromWidgetOfExactType(RootWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}