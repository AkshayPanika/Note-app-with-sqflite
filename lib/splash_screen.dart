import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/Screen_view/home_screen.dart';

import 'Reusable_widget/reusable_text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds:1),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const SizedBox(
                height:18,width:18,
                child: CircularProgressIndicator(backgroundColor: Colors.black,color: Colors.grey,strokeWidth: 3,)),
            const SizedBox(width: 10,),
            Text("Note App",style: textStyle20,),

          ],
        ),
      ),
    );
  }
}
