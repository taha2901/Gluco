import 'package:flutter/material.dart';

class DropdownActivity extends StatefulWidget {
  DropdownActivity();

  @override
  State<DropdownActivity> createState() => _CustomTextFieldDropdownState();
}

class _CustomTextFieldDropdownState extends State<DropdownActivity> {
  @override
  String? selectedItem;
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            disabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
    
          hint: const Text("النشاط"),
          value: selectedItem,
          items: ["مشى","جرى"].map((e){
            return DropdownMenuItem<String>(
              child: Text("$e"),
              value: e,
            );
          }).toList(),
          onChanged: (value){}),
    );
  }
}

