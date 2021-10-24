import 'package:flutter/cupertino.dart';

class NavigatorSlide extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  NavigatorSlide({
    required this.child,
    required this.direction,
  }) : super(
          transitionDuration: Duration(milliseconds: 500),
          reverseTransitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOffset(),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return Offset(0, -1);

      case AxisDirection.down:
        return Offset(0, 1);

      case AxisDirection.right:
        return Offset(1, 0);

      case AxisDirection.left:
        return Offset(-1, 0);
    }
  }
}
