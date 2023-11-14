import 'package:flutter/material.dart';
import 'package:note_app/Services_folder/note_provider.dart';
import 'package:note_app/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) =>  NoteProvider(),),
    ],
      child: Builder(
        builder: (BuildContext context) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
