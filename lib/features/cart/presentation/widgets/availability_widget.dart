import 'package:flutter/material.dart';

class AvailabilityWidget extends StatelessWidget {
  const AvailabilityWidget(
      {super.key,
      required this.caption,
      required this.height,
      required this.width,
      this.curvedLeft = false,
      this.centerCaption = false});
  final String caption;
  final double width;
  final double height;
  final bool curvedLeft;
  final bool centerCaption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: curvedLeft
            ? const BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))
            : const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
        gradient: const LinearGradient(colors: [
          Color.fromARGB(255, 79, 71, 155),
          Color.fromARGB(255, 43, 40, 73),
        ]),
      ),
      child: Row(
        mainAxisAlignment: centerCaption
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceAround,
        children: [
          Text(
            caption,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }
}
