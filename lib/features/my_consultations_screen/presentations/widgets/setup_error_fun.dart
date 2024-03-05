import 'package:doctoria_app/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
void setupErrorState(BuildContext context, String message) {
  context.pop();
  showDialog(context: context,
    builder: (context) => AlertDialog(
      content: Text(message,
        style: TextStyles.font14Blue500,
      ),
      actions: [
        TextButton(onPressed: (){
          context.pop();
        }, child: Text('Got It ',style: TextStyles.font20Blue600,)),
      ],
      icon: const Icon(Icons.error,
        color: Colors.red,
        size: 32,
      ),
    ),);
}