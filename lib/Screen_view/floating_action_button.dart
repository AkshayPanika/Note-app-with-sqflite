import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/Reusable_widget/reusable_container.dart';
import 'package:note_app/Services_folder/note_model.dart';
import 'package:note_app/Services_folder/note_provider.dart';
import 'package:provider/provider.dart';

import '../Reusable_widget/text_field_widget.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({super.key});
  @override
  State<FloatingActionButtonWidget> createState() => _FloatingActionButtonWidgetState();
}
class _FloatingActionButtonWidgetState extends State<FloatingActionButtonWidget> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  addNote(String userTitle,String userSubtitle, String time, String date)async{
    context.read<NoteProvider>().addNote(NoteModel(title: userTitle, subtitle: userSubtitle, time: time, date: date));
  }

  @override
  Widget build(BuildContext context) {
    return ReusableContainerIcon(iconData: Icons.add, height: 40, width: 60,
        onTap: (){
         showModalBottomSheet(context: context,
             backgroundColor: Colors.black,
             isScrollControlled: true,
             builder: (context) {
               return Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 30),
                 child: Column(
                   children: [
                     const SizedBox(height:30,),
                     ///___ TextFieldWidget
                     TextFieldWidget(
                       titleController: titleController,
                       subtitleController:subtitleController,
                       title:'Title', subtitle: "Type somethings here... ",
                     ),
                     const SizedBox(height: 30,),
                     Align(
                         alignment: Alignment.centerRight,
                         child: Consumer<NoteProvider>(builder: (context, value, child) {
                           return ReusableContainerText(title: "Save", height: 40, width: 80,
                               onTap: (){
                                  String title = titleController.text;
                                  String subtitle = subtitleController.text;
                                if(title != "" && subtitle != ""){
                                  value.addNote(NoteModel(title: title, subtitle: subtitle, time: DateFormat('jms').format(DateTime.now()).toString(),date: DateFormat('yMMMd').format(DateTime.now()).toString()));
                                  value.addCountItem();
                                  Navigator.pop(context);
                                  titleController.clear();
                                  subtitleController.clear();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: const Text("Note is added!"),backgroundColor: Colors.grey,)
                                  );
                                }
                           });
                         },)
                     ),
                   ],
                 ),
               );
             },
         );
        }
      );
  }
}
