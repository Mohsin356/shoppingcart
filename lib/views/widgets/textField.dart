import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  const TextFields(
      {Key? key,
        required this.title,
        required this.controller,
      })
      : super(key: key);
  final String title;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: controller,
                style: const TextStyle(color: Colors.black,
                    fontSize: 15),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: title,
                  enabledBorder:  const UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.black,)
                  ),
                  focusedBorder:  const UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.blue,)
                  ),
                  labelStyle:  const TextStyle(color: Colors.black,
                  fontSize: 16),
                ),
              )),
        ],
      ),
    );
  }
}