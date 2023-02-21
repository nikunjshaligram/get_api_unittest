import 'dart:convert';

import 'package:api_call_unittest/model/albummodel.dart';
import 'package:http/http.dart' as http;

Future<AlbumModel> fetchAlbum(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );

  if (response.statusCode == 200) {
    return AlbumModel.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception('Failed to load album');
  }
}

// Mandavdhar, Gujarat 364750
// Sarangpur, Gujarat 382450

// direct -- 3:37

// sarangpur to manadavdhar -- 1
// iskon to sarangpur -- 2:50

