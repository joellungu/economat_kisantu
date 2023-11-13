import 'dart:convert';

import 'package:economat_kisantu/utils/vente_entite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class JournalVente extends GetView {
  //
  var box = GetStorage();
  //
  RxList journalsVentes = [].obs;
  String exercice = "";
  RxString totalVide = "".obs;
  //
  RxString recherche = "".obs;
  //
  JournalVente() {
    exercice = box.read("exercice") ?? "";
    journalsVentes.value = box.read("ventes$exercice") ?? [];
    //
  }

  @override
  Widget build(BuildContext context) {
    //
    return Obx(
      () => Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          height: 70,
          child: Center(
            child: Container(
              width: 300,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      onChanged: (t) {
                        //
                        //recherche.value = "";
                        recherche.value = t;
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 55,
                    width: 55,
                    color: Colors.black,
                    alignment: Alignment.center,
                    child: IconButton(
                      onPressed: () {
                        //
                        //DateTime d = DateTime.now();
                        //
                        //recherche.value = "${d.day}-${d.month}-${d.year}";
                        //
                      },
                      icon: const Icon(
                        Icons.print_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListView(
            padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
            children: List.generate(journalsVentes.length, (index) {
              //

              //
              Map vente = journalsVentes[index];
              //
              RxDouble totalF = 0.0.obs;
              //
              vente["totalF"] = vente["totalF"] ?? totalF.value;
              //
              totalVide.value = "";
              //date_enregistrement
              print("vente: ${jsonEncode(vente)}");

              if ("${vente['date_enregistrement']}"
                      .toLowerCase()
                      .contains(recherche.value.toLowerCase()) ||
                  "${vente['note']}"
                      .toLowerCase()
                      .contains(recherche.value.toLowerCase())) {
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
                                    borderRadius: BorderRadius.circular(10)),
                                alignment: Alignment.center,
                                child: Text(
                                  "${index + 1}",
                                  style: const TextStyle(
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
                              child: const Row(
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
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                "Débit",
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
                                "Crédit",
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
                              child: Obx(() {
                                RxString st = "${vente["totalF"]}".obs;
                                return Text(
                                  vente['solder'] == 0
                                      ? totalVide.value
                                      : st.value,
                                  //
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
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
                              //
                              child: Obx(
                                () => Text(
                                  vente['solder'] == 0
                                      ? "${totalF.value}" //
                                      : totalVide.value,
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
                            flex: 1,
                            child: Container(
                              //color: Colors.grey.shade300,
                              alignment: Alignment.center,
                              child: vente['solder'] == 0
                                  ? InkWell(
                                      onTap: () {
                                        //
                                        TextEditingController libelle =
                                            TextEditingController();
                                        //
                                        TextEditingController montant =
                                            TextEditingController();
                                        //

                                        //
                                        Get.dialog(
                                          Material(
                                            color: Colors.transparent,
                                            child: Center(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                height: 300,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text("Paiement"),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Text(
                                                        "${vente['note']}",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      controller: libelle,
                                                      decoration:
                                                          InputDecoration(
                                                        label: Text(
                                                            "Résumé paiement"),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    TextField(
                                                      controller: montant,
                                                      decoration:
                                                          InputDecoration(
                                                        label: Text(
                                                            "Montant payé"),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Expanded(
                                                          flex: 4,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              //

                                                              VenteEntite aPrime = VenteEntite(
                                                                  totalF: vente[
                                                                      'totalF'],
                                                                  date_enregistrement:
                                                                      vente[
                                                                          'date_enregistrement'],
                                                                  taux: vente[
                                                                      'taux'],
                                                                  taux_montant:
                                                                      vente[
                                                                          'taux_montant'],
                                                                  solder: vente[
                                                                      'solder'],
                                                                  exercice: vente[
                                                                      'exercice'],
                                                                  client: vente[
                                                                      'client'],
                                                                  date_facture:
                                                                      vente[
                                                                          'date_facture'],
                                                                  date_echeance:
                                                                      vente[
                                                                          'date_echeance'],
                                                                  reference: vente[
                                                                      'reference'],
                                                                  note: vente[
                                                                      'note'],
                                                                  produits_services:
                                                                      vente[
                                                                          'produits_services']);
                                                              //
                                                              aPrime
                                                                  .note = vente[
                                                                      'note'] +
                                                                  " // ${libelle.text}";
                                                              aPrime.totalF =
                                                                  double.parse(
                                                                      montant
                                                                          .text);
                                                              //
                                                              aPrime.solder = 1;
                                                              journalsVentes
                                                                  .add(aPrime
                                                                      .toMap());

                                                              //
                                                              box.write(
                                                                  "ventes$exercice",
                                                                  journalsVentes);
                                                              //

                                                              Get.back();
                                                              Get.snackbar(
                                                                  "Succès",
                                                                  "L'opération a bien été enregistré");
                                                            },
                                                            child: Text(
                                                                "Enregistrer"),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          flex: 4,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              //
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              "Annuler",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .red
                                                                    .shade700,
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
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
                          print("ps['montant_tva'] : 1 ${ps['montant_tva']}");
                          print("ps['montant_tva'] : 2 ${ps['total']}");
                          //
                          totalF.value = totalF.value +
                              (ps['total'].runtimeType == String
                                  ? double.parse("0")
                                  : ps['total']);
                          //
                          if (ps['montant_tva'] != 0.0) {
                            double tt = ps['total'].runtimeType == String
                                ? double.parse("0")
                                : ps['total'];
                            double montant_tva =
                                ps['montant_tva'].runtimeType == String
                                    ? double.parse("0")
                                    : ps['montant_tva'];
                            //ps['montant_tva'];
                            return Column(
                              children: [
                                Row(
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
                                          vente['solder'] == 0
                                              ? "${tt - montant_tva}"
                                              : "",
                                          style: const TextStyle(
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
                                          vente['solder'] == 0
                                              ? ""
                                              : "${tt - montant_tva}",
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
                                ),
                                Row(
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
                                                  "",
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
                                          "TVA",
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
                                          vente['solder'] == 0
                                              ? "${ps['montant_tva']}"
                                              : "",
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
                                          vente['solder'] == 0
                                              ? ""
                                              : "${ps['montant_tva']}",
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
                                ),
                              ],
                            );
                          } else {
                            //
                            return Row(
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
                                      vente['solder'] == 0
                                          ? "${ps['total']}"
                                          : "",
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
                                      vente['solder'] == 0
                                          ? ""
                                          : "${ps['total']}",
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
                          }
                        }),
                      )
                      ////////////////////////////////////////////////////////
                    ],
                  ),
                );
              } else {
                return Container();
              }
            }),
          ),
        ),
      ]),
    );
  }
}
