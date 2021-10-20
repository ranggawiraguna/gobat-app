import 'package:flutter/cupertino.dart';

class NavigatorScale extends PageRouteBuilder {
  final Widget child;

  NavigatorScale({
    this.child,
  }) : super(
          transitionDuration: Duration(seconds: 1),
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
