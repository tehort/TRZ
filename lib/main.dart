import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart' as sl;
import 'package:trz/ui/pages/login/login.page.dart';

void main() {
  // init service locator
  sl.init();

  runApp(
    TRZ(),
  );
}

class TRZ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Resident Zombie',
      theme: ThemeData(
        accentColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
