import 'package:flutter/material.dart';

import 'database_helper.dart';
import 'note_model.dart';

class NoteScreen extends StatelessWidget {
  final Note? note;

  /*const*/ NoteScreen({Key? key, this.note}) : super(key: key);

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    if (note != null) {
      titleController.text = note!.title;
      descriptionController.text = note!.description;
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(note == null ? "Add a note" : "Edit a note"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              /*GestureDetector(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("assets/profile.jpg"),
                ),
              ),*/
              const Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 30.0),
                child: Center(
                    child: Text(
                  "What are you thinking about ?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  controller: titleController,
                  maxLines: 1,
                  decoration: const InputDecoration(
                      hintText: 'Title',
                      labelText: 'Note title',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 0.75,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    hintText: 'type here note',
                    labelText: 'Note description',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                keyboardType: TextInputType.multiline,
                onChanged: (str) {},
                maxLines: 2,
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: SizedBox(
                  height: 35,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () async {
                        final title = titleController.value.text;
                        final description = descriptionController.value.text;

                        if (title.isEmpty || description.isEmpty) {
                          return;
                        }

                        final Note model = Note(
                            title: title,
                            description: description,
                            id: note?.id);

                        if (note == null) {
                          await DatabaseHelper.addNote(model);
                        } else {
                          await DatabaseHelper.updateNote(model);
                        }
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white, width: 0.75),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.0))))),
                      child: Text(
                        note == null ? "Save" : "Edit",
                        style: const TextStyle(fontSize: 20),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
