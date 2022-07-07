import 'package:flutter/material.dart';

class ListViewContainer extends StatelessWidget {
  final Widget listView;
  final double height;
  final bool hasData;

  ListViewContainer({required this.listView, required this.height, this.hasData = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.maxFinite,
      child: hasData ? listView : CircularProgressIndicator(),
    );
  }
}
