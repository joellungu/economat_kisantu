import 'dart:convert';

import 'package:economat_kisantu/pages/journal/journal_achat/journal_achat.dart';
import 'package:economat_kisantu/pages/parametres/code_comptable/code_comptable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Journal extends StatelessWidget {
  //
  var box = GetStorage();
  //
  RxList journalsAchats = [].obs;
  RxList journalsVentes = [].obs;
  //
  String exercice = "";
  Journal() {
    //
    exercice = box.read("exercice") ?? "";
    journalsAchats.value = box.read("achats$exercice") ?? [];
    journalsVentes.value = box.read("ventes$exercice") ?? [];
    //print("acahat journalsAchats: $journalsAchats");
    //print("acahat journalsVentes: ${jsonEncode(journalsVentes)}");
  }

  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Exercice $exercice / Journal comptable",
              style: TextStyle(
                fontSize: 15,
                color: Colors.teal.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 30,
            width: double.maxFinite,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "N°",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Numéro de compte",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Libellé",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Débit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Crédit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  color: Colors.white,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Journal de ventes",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Obx(
                  () => Column(
                    children: List.generate(journalsVentes.length, (index) {
                      //
                      Map vente = journalsVentes[index];
                      //date_enregistrement
                      print("acahat: $vente");
                      //
                      return Container(
                        padding: const EdgeInsets.all(5),
                        //height: 200,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///////////////////////////////////////////////////////
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${index + 1}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${vente['date_enregistrement'] ?? '12-12-2023'} -> ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${vente['note']}  ",
                                          style: TextStyle(
                                            color: Colors.teal.shade700,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),

                            ////////////////////////////////////////////////////////

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "${vente['client']['compte_defaut']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "${vente[''] ?? ''}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Client",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${vente['']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${vente['']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: vente['solder'] == 0
                                        ? InkWell(
                                            onTap: () {
                                              //
                                            },
                                            child: Text(
                                              "Payer",
                                              style: TextStyle(
                                                color: Colors.teal.shade700,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: List.generate(
                                  vente['produits_services'].length, (index) {
                                Map ps = vente['produits_services'][index];
                                //
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                "",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                "${ps['code']}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${ps['article']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${vente['']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${vente['']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Container(),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            )
                            ////////////////////////////////////////////////////////
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Journal d'achats",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Obx(
                  () => Column(
                    children: List.generate(journalsAchats.length, (index) {
                      //
                      Map achat = journalsAchats[index];
                      //date_enregistrement
                      print("acahat: $achat");
                      //
                      return Container(
                        padding: const EdgeInsets.all(5),
                        //height: 200,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ///////////////////////////////////////////////////////
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "${index + 1 + journalsVentes.length}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${achat['date_enregistrement'] ?? '12-12-2023'} -> ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${achat['note']}  ",
                                          style: TextStyle(
                                            color: Colors.teal.shade700,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                              ],
                            ),

                            ////////////////////////////////////////////////////////

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "${achat['fournisseur']['compte_defaut']}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Text(
                                            "${achat[''] ?? ''}",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Fournisseur",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${achat['']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${achat['']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    //color: Colors.grey.shade300,
                                    alignment: Alignment.center,
                                    child: achat['solder'] == 0
                                        ? InkWell(
                                            onTap: () {
                                              //
                                            },
                                            child: Text(
                                              "Payer",
                                              style: TextStyle(
                                                color: Colors.teal.shade700,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: List.generate(
                                  achat['produits_services'].length, (index) {
                                Map ps = achat['produits_services'][index];
                                //
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                          color: Colors.grey.shade300,
                                          alignment: Alignment.center,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 5,
                                                child: Text(
                                                  "${ps['code']}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 10,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${ps['article']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${achat['']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.grey.shade300,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "${achat['']}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Container(),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            )
                            ////////////////////////////////////////////////////////
                          ],
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  //
}
