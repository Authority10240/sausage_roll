import 'package:flutter/material.dart';
import 'package:sausage_roll/core/sausage_roll_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.caption, required this.onTap});
  final String caption;
  final Function() onTap;

  @override
  Widget build(context) {
    return InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Center(
              child: Text(
                caption,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 43, 40, 73)),
              ),
            ),
          ),
        ));
  }
}
