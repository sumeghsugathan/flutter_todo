import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/firebase_options.dart';
import 'package:todoapp/provider/toroprovider.dart';
import 'screens/splashscreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //initialiaze the hive
  await Hive.initFlutter();

  //open a box

  await Hive.openBox("mybox");

  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        theme: ThemeData(
          dialogTheme: DialogTheme(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              //
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const Splash(),
      ),
    );
  }
}
