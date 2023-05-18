import 'package:flutter/material.dart';

import 'note_model.dart';

class NoteCardWidgets extends StatelessWidget{
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const NoteCardWidgets({
    Key? key ,
    required this.note,
    required this.onTap,
    required this.onLongPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0 , horizontal: 24.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(note.title, style: TextStyle(
                      fontSize: 18 , fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0 , horizontal: 12),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(note.description , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}