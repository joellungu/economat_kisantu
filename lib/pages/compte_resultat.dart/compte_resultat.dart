import 'package:economat_kisantu/pages/parametres/code_comptable/code_comptable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompteResultat extends StatelessWidget {
  //
  //CodeComptableController codeComptableController =
  //  Get.put(CodeComptableController());

  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(children: [
          TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text("Exploitations"),
              ),
              Tab(
                child: Text("Financiers"),
              ),
              Tab(
                child: Text("Exceptionnels"),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                Container(),
                Container(),
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
