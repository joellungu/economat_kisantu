import 'dart:convert';

import 'package:economat_kisantu/pages/journal/journal_achat/journal_achat.dart';
import 'package:economat_kisantu/pages/journal/journal_vente/journal_vente.dart';
import 'package:economat_kisantu/pages/parametres/code_comptable/code_comptable.dart';
import 'package:economat_kisantu/utils/achat_entite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'journal_caisse/journal_caisse.dart';

class Journal extends StatelessWidget {
  //
  var box = GetStorage();
  //
  RxList journalsAchats = [].obs;
  RxList journalsVentes = [].obs;
  //
  //Map aPrime = {};
  //
  String exercice = "";
  RxString totalVide = "".obs;
  Journal() {
    //
    exercice = box.read("exercice") ?? "";
    //print("acahat journalsAchats: $journalsAchats");
    //print("acahat journalsVentes: ${jsonEncode(journalsVentes)}");
  }

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
                child: Text("Journal d'achat"),
              ),
              Tab(
                child: Text("Journal vente"),
              ),
              Tab(
                child: Text("Journal caisse"),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
                JournalAchat(),
                JournalVente(),
                JournalCaisse(),
              ],
            ),
          )
        ]),
      ),
    );
  }
  //
}
