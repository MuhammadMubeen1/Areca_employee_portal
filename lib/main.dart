import 'package:employe_portal/firebase_options.dart';
import 'package:employe_portal/view/create_employee.dart';
import 'package:employe_portal/view/login_screen.dart';
import 'package:employe_portal/view/spalsh_screen.dart';
import 'package:employe_portal/view/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:shared_preferences/shared_preferences.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(); // Initialize Firebase
  

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Login_Screen()
      // aUsers(),
      //SplashScreen()
     // Login_Screen()
        
      
    );
  }
}
