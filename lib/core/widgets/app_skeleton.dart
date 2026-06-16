import 'package:flutter/material.dart';

class AppSkeleton extends StatelessWidget {
  const AppSkeleton({
    super.key,
    this.height = 16,
    this.width,
    this.borderRadius = 12,
  });

  final double height;
  final double? width;
  final double borderRadius;

  ///Flutter 中的 BoxDecoratin 不是独立 Widget，而是传给 Container(decoration:)或
  ///DecoratedBox(decoration:)的装饰对象，用来绘制背景色、渐变、圆角、边框、阴影、背景图等
  ///"flutter BoxDecoratio..."点击查看元宝的回答
  // https://yb.tencent.com/s/IeLKTJq4waJ2
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
