import 'package:flutter/cupertino.dart';

class BouncyPageRoute extends PageRouteBuilder {
  final Widget widget;

  BouncyPageRoute({this.widget})
      : super(
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (BuildContext Context, Animation<double> animation,
          Animation<double> secAnimation, Widget child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.elasticInOut);

        return ScaleTransition(
          alignment: Alignment.center,
          scale: animation, child: child,
        );
      },
      pageBuilder: (BuildContext Context, Animation<double> animatiion,
          Animation<double> secAnimation) {
        return widget;
      }
  );
}