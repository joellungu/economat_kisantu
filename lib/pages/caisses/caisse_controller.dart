import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CaisseController extends GetxController {
  //
  var box = GetStorage();
  //
  tousLesAchats() async {
    //
    String exercice = box.read("exercice") ?? "";
    //
    List caisses = box.read("caisses$exercice") ?? [];
    //
    print("caisses: $caisses");
    //
  }

//
  enregistrerAchats(Map code) {
    //
    String exercice = box.read("exercice") ?? "";
    //
    List caisses = box.read("caisses$exercice") ?? [];
    //
    caisses.add(code);
    //
    box.write("caisses$exercice", caisses);
    //
    tousLesAchats();
  }
}
