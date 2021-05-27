// To parse this JSON data, do
//
//     final selectGame = selectGameFromJson(jsonString);

import 'dart:convert';

SelectGame selectGameFromJson(String str) => SelectGame.fromJson(json.decode(str));

String selectGameToJson(SelectGame data) => json.encode(data.toJson());

class SelectGame {
  SelectGame({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  List<Datum> data;

  factory SelectGame.fromJson(Map<String, dynamic> json) => SelectGame(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.desc,
    this.icon,
    this.play,
    this.tag1,
    this.tag2,
    this.tag3,
    this.tag4,
    this.tag5,
    this.run,
    this.like,
    this.comn,
    this.report,
    this.statusgame,
    this.published,
  });

  String id;
  String title;
  String desc;
  String icon;
  String play;
  String tag1;
  String tag2;
  String tag3;
  String tag4;
  String tag5;
  String run;
  String like;
  String comn;
  String report;
  String statusgame;
  String published;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    desc: json["desc"],
    icon: json["icon"],
    play: json["play"],
    tag1: json["tag1"],
    tag2: json["tag2"],
    tag3: json["tag3"],
    tag4: json["tag4"],
    tag5: json["tag5"],
    run: json["run"],
    like: json["like"],
    comn: json["comn"],
    report: json["report"],
    statusgame: json["statusgame"],
    published: json["published"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "icon": icon,
    "play": play,
    "tag1": tag1,
    "tag2": tag2,
    "tag3": tag3,
    "tag4": tag4,
    "tag5": tag5,
    "run": run,
    "like": like,
    "comn": comn,
    "report": report,
    "statusgame": statusgame,
    "published": published,
  };
}
