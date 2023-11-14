import 'package:flutter/material.dart';
import 'package:note_app/Reusable_widget/reusable_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  final String title;
  final String subtitle;
  TextFieldWidget({super.key, required this.title, required this.subtitle,required this.titleController, required this.subtitleController });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller:titleController ,
          style: textStyle19,
          decoration: InputDecoration(
            label:Text(title),
            labelStyle:textStyle19,
            //border: InputBorder.none,
            focusedBorder:  UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 0.8),borderRadius:BorderRadius.all(Radius.circular(5))),
            enabledBorder:  UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 0.8),borderRadius:BorderRadius.all(Radius.circular(5))),
          ),
        ),

        Container(height: 0.8,color: Colors.grey,),
        const SizedBox(height: 25,),
        TextField(
          controller:subtitleController ,
          style: textStyle19,
          maxLines: 7,
          decoration: InputDecoration(
            label:Text(subtitle),
            labelStyle:textStyle19,
            focusedBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 0.8),borderRadius:BorderRadius.all(Radius.circular(5))),
            enabledBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 0.8),borderRadius:BorderRadius.all(Radius.circular(5))),
          ),
        ),
      ],
    );

  }
}
