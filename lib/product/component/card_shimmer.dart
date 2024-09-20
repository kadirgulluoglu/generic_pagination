import 'package:flutter/material.dart';
import 'package:generic_pagination/core/extensions/context_extension.dart';
import 'package:generic_pagination/product/component/skeleton.dart';

class CardShimmer extends StatelessWidget {
  final double? height;
  const CardShimmer({super.key, this.height = 120});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: context.containerRadius,
          child: Skeleton(
            width: double.infinity,
            height: height,
          ),
        ),
      ],
    );
  }
}
