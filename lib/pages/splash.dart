import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:economat_kisantu/main.dart';
import 'package:economat_kisantu/pages/accueil.dart';

class Splash extends StatelessWidget {
  //
  Splash() {
    //
    Timer(const Duration(seconds: 1), () {
      Get.offAll(Accueil());
    });
  }
  //
  load(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/entite.json");
    print("data: $data");
    entiteAdmin = jsonDecode(data);
    print("data: ${entiteAdmin.length}");
    //
    Get.offAll(Accueil());
  }

  //
  @override
  Widget build(BuildContext context) {
    //

    //load(context);
    //
    return Scaffold();
  }
}
