// To parse this JSON data, do
//
//     final dataGame = dataGameFromJson(jsonString);

import 'dart:convert';

List<DataGame> dataGameFromJson(String str) => List<DataGame>.from(json.decode(str).map((x) => DataGame.fromJson(x)));

String dataGameToJson(List<DataGame> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataGame {
  DataGame({
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

  factory DataGame.fromJson(Map<String, dynamic> json) => DataGame(
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
