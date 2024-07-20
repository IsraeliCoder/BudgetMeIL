import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'auth_gate.dart';

// To be able to compile please run :
// flutter packages get

// to build the program you will need to install firebase extensions:
// use only the npm installation process: 
// 1. first install node.js https://nodejs.org/en
// 2. follow the tutorials to install everything correctly:
//    * https://firebase.google.com/docs/flutter/setup?platform=android
//    * https://firebase.google.com/docs/cli#install-cli-windows
// 3. after all the installation use the following youtube guild to make firebase run : 
//    * https://www.youtube.com/watch?v=6Vc_E20o5wE&ab_channel=WTFCode

// authenticate link: https://firebase.google.com/codelabs/firebase-auth-in-flutter-apps#2



void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: "Budget-Me-IL",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 156, 125, 24)),
        ),
        home: AuthGate(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  
}

