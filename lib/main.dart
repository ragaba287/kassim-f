import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/settings/addCity.dart';
import 'screens/settings/cities.dart';
import 'screens/settings/passCode.dart';
import 'screens/settings/prices.dart';
import 'screens/settings/settings.dart';
import './utils/constant.dart';
import './screens/addStudent.dart';
import './screens/gradeList.dart';
import 'screens/home.dart';
import 'screens/sgin/splash.dart';
import './screens/sgin/signin.dart';
import 'screens/settings/password.dart';

// Future<String> checkIfLoggedIn() async {
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   return sharedPreferences.get('isLoggedIn') ? HomeScreen.id : SplashScreen.id;
// }
var _userName;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  _userName = sharedPreferences.getString('userName');
  print(_userName);

  runApp(Kassim());
}

class Kassim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      //TODO Transition Screens
      initialRoute: _userName == null ? SplashScreen.id : HomeScreen.id,
      color: kMainColorTheam,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Signin.id: (context) => Signin(),
        HomeScreen.id: (context) => HomeScreen(),
        GradeList.id: (context) => GradeList(),
        AddStudent.id: (context) => AddStudent(),
        Cities.id: (context) => Cities(),
        Settings.id: (context) => Settings(),
        PassCode.id: (context) => PassCode(),
        PricesScreen.id: (context) => PricesScreen(),
        AddCity.id: (context) => AddCity(),
        PasswordScreen.id: (context) => PasswordScreen(),
      },
    );
  }
}
