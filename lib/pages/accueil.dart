import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:economat_kisantu/utils/langi.dart';
import 'parametres/parametres.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _Accueil();
}

class _Accueil extends State<Accueil> with TickerProviderStateMixin {
  late final TabController _tabController;
  //
  //

  //

  //
  // EvenementController evenementController = Get.put(EvenementController());
  // //
  // UtilisateurController utilisateurController =
  //     Get.put(UtilisateurController());
  // //
  // CalendrierController calendrierController = Get.put(CalendrierController());
  // //
  // HoraireController horaireController = Get.put(HoraireController());
  // //
  // InfosController infosController = Get.put(InfosController());
  // //
  // LiveController liveController = Get.put(LiveController());
  // //
  // NiveauController niveauController = Get.put(NiveauController());
  //
  //Horaire//Calendrier//Evenement//Utilisateur//Infos//Live/
  Rx<Widget> vue = Rx(Parametres());
  RxInt choix = 0.obs;
  //
  List angles = [
    {"titre": "Ventes", "icon": "HeroiconsCalendarDaysSolid"},
    {"titre": "Achats", "icon": "PhCalendarCheckFill"},
    {"titre": "Caisse", "icon": "CarbonPiggyBankSlot"},
    {"titre": "Banque", "icon": "IcBaselineDoorBack"},
    {"titre": "Op. diverses", "icon": "PhCalendarCheckFill"},
    {"titre": "Journaux", "icon": "JamNewspaperF"},
    {"titre": "Bilan", "icon": "PhUserDuotone"},
    {"titre": "Liv. de compte", "icon": "BasilBookOpenSolid"},
    {"titre": "Clients & Fournisseurs", "icon": "IonPeople"},
    {"titre": "Parametres", "icon": "SolarSettingsMinimalisticBold"},
  ];
  //
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Langi.base1,
      child: SafeArea(
        child: Scaffold(
          body: Obx(() => vue.value),
          bottomNavigationBar: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(angles.length, (index) {
                Map e = angles[index];
                return InkWell(
                  onTap: () {
                    //
                    choix.value = index;
                    //
                    if (choix.value == 0) {
                      vue.value = Container();
                    } else if (choix.value == 1) {
                      vue.value = Container();
                    } else if (choix.value == 2) {
                      vue.value = Container();
                    } else if (choix.value == 3) {
                      vue.value = Container();
                    } else if (choix.value == 4) {
                      vue.value = Container();
                    } else if (choix.value == 5) {
                      vue.value = Container();
                    } else {
                      vue.value = Container();
                    }
                  },
                  child: Obx(
                    () => Expanded(
                      flex: 2,
                      child: SizedBox(
                        //flex: 1,
                        //width: 70,
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/${e["icon"]}.svg",
                              colorFilter: index == choix.value
                                  ? ColorFilter.mode(
                                      Langi.base2, BlendMode.srcIn)
                                  : ColorFilter.mode(
                                      Colors.grey, BlendMode.srcIn),
                              semanticsLabel: e["titre"],
                              height: 30,
                              width: 30,
                            ),
                            Text(
                              e["titre"],
                              style: TextStyle(
                                fontSize: 10,
                                color: index == choix.value
                                    ? Langi.base2
                                    : Colors.grey,
                                fontWeight: index == choix.value
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
