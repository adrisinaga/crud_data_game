import 'package:data_game/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditGamePage extends StatelessWidget {
  final GameController gameController = Get.put(GameController());

  void _editGame(int id) {
    gameController.editGame(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                'Edit Data',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: gameController.titleController,
                decoration: InputDecoration(hintText: 'Title'),
              ),
              TextField(
                controller: gameController.descController,
                decoration: InputDecoration(hintText: 'Desc'),
              ),
              TextField(
                controller: gameController.iconController,
                decoration: InputDecoration(hintText: 'Icon'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.green,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: ()=> _editGame(gameController.id.value),
                child: Text('Edit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
