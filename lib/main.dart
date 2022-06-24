
import 'package:audioplayer/Providers/ReaderProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/HomeScreen/HomeScreen.dart';
import 'Screens/HomePage/homeScreen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(
    MultiProvider(
  providers: [
    ListenableProvider(create: (cox)=> ReaderP())
  ],
  child:MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage(),

  ),
));
}