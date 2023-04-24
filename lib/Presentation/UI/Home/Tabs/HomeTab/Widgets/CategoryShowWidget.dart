import 'package:flutter/material.dart';

import '../../../../../../Core/Theme/MyTheme.dart';

class CategoryShowWidget extends StatelessWidget {
  String image ;
  String name ;
  CategoryShowWidget({required this.image , required this.name});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(

          children: [
            Container(
              padding:const EdgeInsets.all(15),
              margin:const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyTheme.lightBlue,
              ),
              child: Image.network(image , height: 60,),
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style:const TextStyle(
                  fontSize: 14,
                  color: MyTheme.darkBlue,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
