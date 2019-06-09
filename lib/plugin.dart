import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifPlugin{

  NotifPlugin(){
    _init();
  }

  _init() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> _time = pref.getStringList('_time') ?? ['9','0','14','0','19','0'];
    await FlutterLocalNotificationsPlugin().cancelAll();
    for(int number = 0; number < 3; number++){
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      var initializationSettingsAndroid = AndroidInitializationSettings('@drawable/yoga');
      var initializationSettingsIOS = IOSInitializationSettings();
      var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
      flutterLocalNotificationsPlugin.initialize(initializationSettings);
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'repeatDailyAtTime channel id',
        'repeatDailyAtTime channel name',
        'repeatDailyAtTime description',
      );
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      var time = Time(int.parse(_time[2*number]), int.parse(_time[2*number+1]), 0);
      flutterLocalNotificationsPlugin.showDailyAtTime(
          number,
          'Не забудьте сделать упражнения',
          '',
          time,
          platformChannelSpecifics);
    }
  }
}