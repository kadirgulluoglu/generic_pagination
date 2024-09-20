import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends Shimmer {
  final double? width;
  final double? height;
  final double radius;
  final bool isCircle;

  Skeleton({
    super.key,
    this.width,
    this.height,
    this.radius = 0,
    this.isCircle = false,
  }) : super(
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade300,
              Colors.grey.shade100,
              Colors.grey.shade300,
            ],
            stops: const [0.35, 0.5, 0.65],
          ),
          child: Container(
            width: width ?? double.infinity,
            height: height ?? 20,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              borderRadius: isCircle ? null : BorderRadius.circular(radius),
            ),
          ),
        );
}
