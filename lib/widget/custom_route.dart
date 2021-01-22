import 'package:flutter/material.dart';

//缩放路由动画
class CustomRoute1<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  CustomRoute1(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionDuration: Duration(milliseconds: duration_ms),
          transitionsBuilder: (context, a1, a2, child) => ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0)
                .animate(CurvedAnimation(parent: a1, curve: curve)),
            child: child,
          ),
        );
}

//渐变透明路由动画
class CustomRoute2<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  CustomRoute2(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(milliseconds: duration_ms),
            transitionsBuilder: (context, a1, a2, child) => FadeTransition(
                  opacity: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: child,
                ));
}

//旋转路由动画
class CustomRoute3<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  CustomRoute3(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => child,
            transitionDuration: Duration(milliseconds: duration_ms),
            transitionsBuilder: (context, a1, a2, child) => RotationTransition(
                  turns: Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
                    parent: a1,
                    curve: curve,
                  )),
                  child: child,
                ));
}

//上--->下
class CustomRoute4<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  CustomRoute4(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) {
              return child;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, -1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//左--->右
class CustomRoute5<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  List<int> mapper;
  CustomRoute5(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : assert(true),
        super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) {
              return child;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//下--->上
class CustomRoute6<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  CustomRoute6(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) {
              return child;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//右--->左
class CustomRoute7<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  CustomRoute7(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) {
              return child;
            },
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child);
            });
}

//缩放+透明+旋转路由动画
class CustomRoute8<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int duration_ms;
  final Curve curve;
  CustomRoute8(
      {this.child, this.duration_ms = 500, this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: duration_ms),
            pageBuilder: (ctx, a1, a2) => child, //页面
            transitionsBuilder: (
              ctx,
              a1,
              a2,
              Widget child,
            ) {
              //构建动画
              return RotationTransition(
                //旋转动画
                turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: a1,
                  curve: curve,
                )),
                child: ScaleTransition(
                  //缩放动画
                  scale: Tween(begin: 0.0, end: 1.0)
                      .animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: FadeTransition(
                    opacity: //透明度动画
                        Tween(begin: 0.5, end: 1.0)
                            .animate(CurvedAnimation(parent: a1, curve: curve)),
                    child: child,
                  ),
                ),
              );
            });
}

//无动画
class CustomRoute9<T> extends PageRouteBuilder<T> {
  final Widget page;
  CustomRoute9(this.page)
      : super(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) => page,
            transitionDuration: Duration(milliseconds: 0),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) => child);
}
