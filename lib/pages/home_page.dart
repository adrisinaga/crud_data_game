import 'package:data_game/controllers/game_controller.dart';

import 'package:data_game/pages/add_game_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final GameController gameController = Get.put(GameController());

  Future<void> _showMyDialog(BuildContext context, int id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Data'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Would you like to remove data ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
                overlayColor: MaterialStateProperty.all<Color>(Colors.red[100]),
              ),
              child: const Text('Remove'),
              onPressed: () => _onDeleteData(context, id),
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pullRefresh() async {
    gameController.readGame();
  }

  Future<void> _onDeleteData(BuildContext context, int id) async {
    gameController.deleteGame(id);
    Navigator.of(context).pop();
  }

  Future<void> _onEdit(int id) async {
    gameController.id.value = id;
    gameController.toEditPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => RefreshIndicator(
            onRefresh: _pullRefresh,
            child: Stack(
              children: [
                Column(
                  children: [
                    Text(
                      'Data Game',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Expanded(
                        child: ListView(
                          children: gameController.dataGame.map((e) {
                            var index = gameController.dataGame.indexOf(e);
                            index++;
                            return Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(child: Text(index.toString())),
                                      SizedBox(width: 10),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [Text(e.title.toString())],
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                          onTap: () =>
                                              _onEdit(int.tryParse(e.id)),
                                          child: Icon(Icons.edit,
                                              color: Colors.green)),
                                      SizedBox(width: 5),
                                      GestureDetector(
                                          onTap: () => _showMyDialog(
                                              context, int.tryParse(e.id)),
                                          child: Icon(Icons.delete,
                                              color: Colors.red)),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add),
                      onPressed: () {
                        Get.to(() => AddGamePage());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
