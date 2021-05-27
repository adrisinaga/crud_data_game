import 'dart:convert';
import 'dart:math';

import 'package:data_game/domain/request.dart';
import 'package:data_game/model/data_game_model.dart';
import 'package:data_game/model/select_game_model.dart';
import 'package:data_game/pages/edit_game_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class GameController extends GetxController{
  RxBool loading = false.obs;
  Map<String, dynamic> body;
  RxList<DataGame> dataGame = <DataGame>[].obs;
  Rx<SelectGame> listSelectGame = SelectGame().obs;
  RxString titleGame = ''.obs;
  final List<IconData> iconData = <IconData>[Icons.call, Icons.school];
  final Random r = Random();
  Icon randomIcon2() => Icon(iconData[r.nextInt(iconData.length)]);

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController iconController = TextEditingController();

  TextEditingController addTitleController = TextEditingController();
  TextEditingController addDescController = TextEditingController();
  TextEditingController addIconController = TextEditingController();

  RxInt id = 0.obs;

  @override
  void onInit() {
    super.onInit();
    readGame();
  }

  void readGame() async {
    Request request = Request(url: 'get_data_game.php');
    request.get().then((value) {
      if(value.statusCode==200){
        List jsonResponse = jsonDecode(value.body);
        dataGame.value = jsonResponse.map((e) => DataGame.fromJson(e)).toList();
        print(dataGame.map((e) => e.title));
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
    printError();
    });
  }

  void addGame() async{
    Request request = Request(url: 'add_data_game.php', body: {
      'title': addTitleController.text,
      'desc': addDescController.text,
      'icon': addIconController.text,
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if(value.statusCode==200){
        if(body['status']=='Success'){
          readGame();
          addTitleController.clear();
          addDescController.clear();
          addIconController.clear();
        }else{
          Fluttertoast.showToast(
              msg: "Sudah ada data game",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void deleteGame(int id)async{
    Request request = Request(url: 'delete_data_game.php', body: {
      'id': id.toString(),
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if(value.statusCode==200){
        if(body['status']=='Success'){
          readGame();
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void toEditPage()async{
    selectGame(id.value);
    Get.to(()=>EditGamePage());
  }

  void editGame(int id)async{
    Request request = Request(url: 'edit_data_game.php', body: {
      'id': id.toString(),
      'title':titleController.text,
      'desc':descController.text,
      'icon':iconController.text,
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      if(value.statusCode==200){
        if(body['status']=='Success'){
          print('success');
          readGame();
          Fluttertoast.showToast(
              msg: "Done",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Get.back();
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }

  void selectGame(int id)async{
    Request request = Request(url: 'select_data_game.php', body: {
      'id': id.toString(),
    });
    request.post().then((value) {
      body = jsonDecode(value.body);
      print(body);
      if(value.statusCode==200){
        listSelectGame.value = SelectGame.fromJson(body);
        if(listSelectGame.value.data!=[]){
          listSelectGame.value.data.map((e) {
            titleController.text = e.title;
            descController.text = e.desc;
            iconController.text = e.icon;
          }).first;
        }
      }else{
        print('Backend error');
      }
    }).catchError((onError) {
      printError();
    });
  }
}