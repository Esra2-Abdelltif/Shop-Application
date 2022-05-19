import 'package:flutter/material.dart';
import 'package:shop_project/shared/Styles/colors.dart';


//MaterialButton

Widget defultMaterialButton({
  double width,
  double height,
  Color backColor =defultColor,
  double borderRadius=25,
  double fontsize=20,
  Color ColorText : Colors.white,
   String text,
  VoidCallback function,
})=> Container(
  width: width,
  height: height,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child:MaterialButton(color:backColor,hoverColor: Colors.black,
    onPressed: function,
    child:Text(text,style: TextStyle(fontSize:fontsize ,color:ColorText,),), ),
);


//TextFormField

Widget defulutTextFormFild ({
  TextEditingController controller,
  FormFieldValidator validator,
   TextInputType type,
   String labeltext,
  String hintText,
  Widget suffix,
   Widget prefix,
  bool obscureText,
  bool secirty,
  Function suffixFun,
  ValueChanged<String> onChanged,
  VoidCallback onTap,

})=>TextFormField(
  validator:validator,
  controller:controller,
  keyboardType: type,
  obscureText: obscureText,
onChanged: onChanged,
  onTap: onTap,
  decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color:defultColor ),
      borderRadius: BorderRadius.circular(25.0),
    ),
    border:  OutlineInputBorder(),
    labelText: labeltext,
    hintText: hintText,
    labelStyle: TextStyle(color: defultColor),
    prefixIcon: prefix,
    suffixIcon: suffix,


  ),


);

//TextButton
Widget defultTextButton({String text ,VoidCallback onPressed})=>
TextButton(onPressed: onPressed,
child: Text(text,));