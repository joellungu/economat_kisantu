import 'package:economat_kisantu/pages/parametres/code_comptable/code_comptable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'code_comptable/code_comptable_controller.dart';
import 'exercice_comptable/exercice_comptable.dart';
import 'exercice_comptable/exercice_comptable_controller.dart';

class Parametres extends StatelessWidget {
  //
  CodeComptableController codeComptableController =
      Get.put(CodeComptableController());
  //
  ExerciceComptableController excerciceComptableController =
      Get.put(ExerciceComptableController());

  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(children: [
          const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text("Codes comptable"),
              ),
              Tab(
                child: Text("Exercice comptable"),
              ),
              Tab(
                child: Text("À propos"),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                CodeComptable(),
                ExerciceComptable(),
                Container(),
              ],
            ),
          )
        ]),
      ),
    );
  }
  //
}
