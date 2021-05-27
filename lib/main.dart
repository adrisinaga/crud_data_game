import 'package:data_game/controllers/game_controller.dart';
import 'package:data_game/pages/add_game_page.dart';
import 'package:data_game/pages/edit_game_page.dart';
import 'package:data_game/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Data Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/homePage',
      getPages: [
        GetPage(name: '/homePage', page: () => HomePage() ),
        GetPage(name: '/addPage', page: () => AddGamePage() ),
        GetPage(name: '/editPage', page: () => EditGamePage() ),
      ],
    );
  }
}