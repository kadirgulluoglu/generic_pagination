import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;

  double get normalValue => height * 0.02;

  double get mediumValue => height * 0.05;

  double get highValue => height * 0.1;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);

  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);

  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);

  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);

  EdgeInsets get pagePadding => EdgeInsets.only(
        left: lowValue,
        right: lowValue,
        top: lowValue,
      );
}

extension GridExtension on BuildContext {
  SliverGridDelegate get productDelegate =>
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: width > 700 ? 4 : 2,
        childAspectRatio: 1 / 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 300,
      );
}

extension RadiusExtension on BuildContext {
  BorderRadius get containerRadius => BorderRadius.circular(15);
}
