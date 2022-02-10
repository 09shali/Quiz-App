
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
const CustomButton({ 
  @required this.buttonText,
  @required this.onPressed,
  this.bgColor, 
  Key key,
   }) : super(key: key);


  final Color bgColor;
  final String buttonText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context){
    return  SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                  primary:bgColor ?? Color(0xFFF44336),
                  onPrimary: Colors.white,),
                  onPressed: onPressed,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30.0
                      ),
                    child: Text (buttonText,
                    style: const TextStyle(
                      fontSize: 26.0,
                    ),
                    ),
                  ),
                  ),
                );
  }
}