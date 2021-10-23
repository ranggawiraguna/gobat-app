import 'package:flutter/cupertino.dart';

class NavigatorScale extends PageRouteBuilder {
  final Widget child;

  NavigatorScale({
    required this.child,
  }) : super(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      ScaleTransition(
        scale: animation,
        child: child,
      );
}
