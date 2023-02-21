import 'package:api_call_unittest/model/albummodel.dart';
import 'package:api_call_unittest/repository/fetchalbum.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetAlbumScreen extends StatefulWidget {
  const GetAlbumScreen({super.key});

  @override
  State<GetAlbumScreen> createState() => _GetAlbumScreenState();
}

class _GetAlbumScreenState extends State<GetAlbumScreen> {
  late final Future<AlbumModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get API With Unit Test'),
      ),
      body: Center(
        child: FutureBuilder<AlbumModel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
