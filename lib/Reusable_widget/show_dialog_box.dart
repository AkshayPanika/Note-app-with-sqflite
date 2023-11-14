import 'package:flutter/material.dart';

class ShowDialogBox extends StatelessWidget {
  final String headline;
  final String title1;
  final String title2;
  const ShowDialogBox({super.key, required this.headline, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      title:const Text("Alert Dialog Box") ,
      content:Text(headline),
      actions: [
        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.black), child:  Text(title1),),
        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(primary: Colors.black), child:  Text(title2),),
      ],
    );
  }
}
