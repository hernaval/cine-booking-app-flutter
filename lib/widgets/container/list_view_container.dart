import 'package:flutter/material.dart';

class ListViewContainer extends StatelessWidget {
  final ListView listView;
  final double height;

  ListViewContainer({required this.listView, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      child: listView,
    );
  }
}
