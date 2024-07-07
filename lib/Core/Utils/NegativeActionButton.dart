
import 'package:flutter/material.dart';

class NegativeActionButton extends StatelessWidget {
  VoidCallback? negativeAction;
  String negativeActionTitle;
  NegativeActionButton({required this.negativeActionTitle , this.negativeAction , super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: (){
          Navigator.pop(context);
          if (negativeAction != null){
            negativeAction!();
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(side: BorderSide(width: 2 , color: Theme.of(context).primaryColor) , borderRadius: BorderRadius.circular(10)))
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: FittedBox(
            child: Text(negativeActionTitle,),
          ),
        ),
      )
    );
  }
}
