import 'package:coinpay/utils/constants.dart';
import 'package:flutter/material.dart';

// text fields style
var kTextFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.grey, style: BorderStyle.none),
    borderRadius: BorderRadius.circular(10));

// buttons across the app
WidgetStateProperty<EdgeInsets> getButtonPadding(BuildContext context,
    {double? horizontal, double? vertical}) {
  return WidgetStateProperty.all<EdgeInsets>(
    EdgeInsets.symmetric(
      horizontal: horizontal ?? MediaQuery.of(context).size.width * 0.4,
      vertical: vertical ?? MediaQuery.of(context).size.height * 0.02,
    ),
  );
}

PreferredSize progressBar(double progressValue) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(6.0),
    child: LinearProgressIndicator(
      backgroundColor: Colors.grey.withOpacity(0.1),
      valueColor: const AlwaysStoppedAnimation<Color>(kAppDefaultColor),
      value: progressValue,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
  );
}
