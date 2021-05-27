import 'package:data_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddGamePage extends StatelessWidget {
  final GameController gameController = Get.put(GameController());

  void _addGame() {
    gameController.addGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Tambah Data',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: gameController.addTitleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: gameController.addDescController,
                decoration: InputDecoration(hintText: 'Desc'),
              ),
              TextField(
                controller: gameController.addIconController,
                decoration: InputDecoration(hintText: 'Icon'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.blue,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: () => _addGame(),
                child: Text('Save'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
