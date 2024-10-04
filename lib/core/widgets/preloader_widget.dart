import 'package:flutter/material.dart';

void preloaderWidgetOverlay(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      });
}

Widget preloaderWidget() {
  return Center(child: CircularProgressIndicator());
}
