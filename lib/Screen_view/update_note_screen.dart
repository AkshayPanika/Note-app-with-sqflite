import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Reusable_widget/reusable_container.dart';
import '../Reusable_widget/text_field_widget.dart';
import '../Services_folder/note_model.dart';
import '../Services_folder/note_provider.dart';

class UpdateNoteScreen extends StatelessWidget {
  String title;
  String subtitle;
  int id;
  UpdateNoteScreen({super.key,required this.title, required this.subtitle, required this.id});

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleController.text = title;
    subtitleController.text = subtitle;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 30),
      child: Column(
        children: [
          const SizedBox(height: 30,),

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
                      value.updateNote(NoteModel(title: titleController.text, subtitle: subtitleController.text, time: DateFormat('jms').format(DateTime.now()).toString(),date: DateFormat('yMMMd').format(DateTime.now()).toString(),id:id));
                      Navigator.pop(context);
                      titleController.clear();
                      subtitleController.clear();
                    }
                    );
              },)
          ),
        ],
      ),
    );
  }
}
