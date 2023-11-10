import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:window_manager/window_manager.dart';
import 'pages/accueil.dart';
import 'pages/splash.dart';

List entiteAdmin = [];

void main() async {
  //
  pourcent(10);
  //
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 800),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  //
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //
    //load(context);
    //
    return GetMaterialApp(
      title: 'Economat Kisantu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )),
        useMaterial3: true,
      ),
      home: Accueil(),
    );
  }
}

pourcent(double pr) {
  //
  //(%) = 100 x Valeur partielle/Valeur totale
  //double prct = (5 * montant) / 100;
  double prct = (100 * 5) / 100;
  //prct * Valeur totale = (100 * Valeur partielle)
  //(prct * Valeur totale) / 100 = Valeur partielle
  double vp = (pr * 300) / 100;
  print("le pourcentage vaut: 1 = $prct");
  print("le pourcentage vaut: 2 = $vp");
}

load() async {
  List l = [1, 3, 4, 5];
  print("liste avant: $l");
  Timer(const Duration(seconds: 3), () {
    //
    l.insert(1, 2);
    print("liste après: $l");
  });
}
