import 'package:economat_kisantu/pages/parametres/code_comptable/code_comptable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Bilan extends StatelessWidget {
  //
  var box = GetStorage();
  //
  String exercice = "";
  Bilan() {
    //
    exercice = box.read("exercice") ?? "";
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
              "Année comptable $exercice",
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
          SizedBox(
            height: Get.size.height / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.black,
                          child: const Text(
                            "ACTIF",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.black,
                          child: const Text(
                            "CAPITAUX PROPRES",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.size.height / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.black,
                          child: const Text(
                            "ACTIFS CIRCULANTS",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.black,
                          child: const Text(
                            "DETTES",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Get.size.height / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.black,
                          child: const Text(
                            "TOTAL GÉNÉRAL",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.black,
                          child: const Text(
                            "TOTAL GÉNÉRAL",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.teal.shade100,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  //
}
