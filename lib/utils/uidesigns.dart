import 'package:flutter/material.dart';

class UiHelper {
  // static customAlertBox(
  //   BuildContext context,
  //   String text,
  // ) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text(text),
  //         );
  //       });
  // }

  static dynaTextfield(
      TextEditingController controller,
      String text,
      IconData iconData,
      bool toHide,
      BuildContext context,
      TextInputAction inputAction) {
    return TextField(
      textInputAction: inputAction,
      controller: controller,
      obscureText: toHide,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    
    );
  }

  static myButton(
    String buttonText,
    VoidCallback onpressed,
    Color buttonColor,
  ) {
    return MaterialButton(
      onPressed: onpressed,
      color: buttonColor,
      child: Text(
        buttonText,
      ),
    );
  }
}
