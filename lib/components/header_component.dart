import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/style.dart';

class HeaderComponent extends StatelessWidget {

  final Widget child;

  const HeaderComponent(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
