import 'package:flutter/material.dart';

class Achats extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    //
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(children: [
          TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                child: Text("Clients"),
              ),
              Tab(
                child: Text("Fournisseurs"),
              ),
            ],
          ),
          Expanded(
            flex: 1,
            child: TabBarView(
              children: [
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
