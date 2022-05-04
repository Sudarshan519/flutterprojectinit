import 'package:flutter/material.dart';
import 'package:get/get.dart';

getTitleText(context, text) => Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(color: Colors.red[700]),
      textAlign: TextAlign.center,
    );
getBackButton(context) => IconButton(
    padding: EdgeInsets.zero,
    color: Theme.of(context).primaryColor,
    onPressed: () => Get.back(),
    icon: const Icon(
      Icons.arrow_back,
      color: Colors.grey,
    ));
titleText(context, text, {color = Colors.white}) => Text(text,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.headline6! //.copyWith(color: color),
    );
