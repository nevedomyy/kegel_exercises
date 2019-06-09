import 'package:flutter/material.dart';


class Info extends StatelessWidget{
  List<Color> _colors = [
    Color.fromRGBO(46, 41, 78, 1),
    Color.fromRGBO(255, 212, 0, 1),
  ];
  String _textInfo = 'Как найти мышцы Кегеля?\nПредставьте, что вам очень хочется писать, но прямо сейчас нельзя. Сожмите мышцы, как будто пытаетесь сдержать мочеиспускание. Сжатые мышцы — это мышцы Кегеля.\n\n'
      'Советы:\nПостарайтесь не задерживать дыхание, не сжимать ягодицы и бедра, не втягивать живот и не толкать вниз вместо сжимания или поднимания.\n'
      'Расслабляйте промежность на вдохе и напрягайте на выдохе.\n'
      'Всегда опустошайте мочевой пузырь перед выполнением упражнений Кегеля.\n'
      'Не приостанавливайте мочеиспускание в качестве ежедневного упражнения Кегеля. Можно добиться обратного эффекта.';

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
                  'Информация',
                  style: TextStyle(color: _colors[0], fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    _textInfo,
                    style: TextStyle(color: _colors[0], fontSize: 17.0),
                  ),
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