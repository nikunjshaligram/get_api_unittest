// ignore_for_file: prefer_collection_literals

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   const Album({required this.userId, required this.id, required this.title});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

import 'dart:convert';

AlbumModel albumFromJson(String str) => AlbumModel.fromJson(json.decode(str));

String albumToJson(AlbumModel data) => json.encode(data.toJson());

class AlbumModel {
  int userId;
  int id;
  String title;

  AlbumModel({required this.userId, required this.id, required this.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
