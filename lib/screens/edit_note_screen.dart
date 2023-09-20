import 'package:flutter/material.dart';
import 'package:notes/colors.dart';

class EditNoteScreen extends StatefulWidget {
  final String title;
  const EditNoteScreen({super.key, required this.title});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final titleController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround,
      appBar:  AppBar(title: Text("Edit Note"),backgroundColor: mainColor,),
      body: Padding(
        padding:  EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(children: [
            SizedBox(height: 10),
            TextFormField(
                controller: titleController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(border: OutlineInputBorder(),
                  label: Text("tittle"),

                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter Tittle";
                  }
                  return null;
                }

            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => addNote(), child: Text("Update"),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),backgroundColor: mainColor,),),
            ),
          ],),
        ),
      ),
    );
  }
  void addNote(){
    if(!formKey.currentState!.validate()){
      return;
    }
    String title = titleController.text;
    Navigator.pop(context, title);
  }
}



