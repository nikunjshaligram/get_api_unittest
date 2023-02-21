// ignore_for_file: depend_on_referenced_packages

import 'package:api_call_unittest/model/albummodel.dart';
import 'package:api_call_unittest/repository/fetchalbum.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final client = MockClient(
        (_) async =>
            http.Response('{"userId" : 1, "id" : 1, "title" : "mock"}', 200),
      );
      expect(await fetchAlbum(client), isA<AlbumModel>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient(
        (_) async => http.Response('Not Found', 400),
      );
      expect(fetchAlbum(client), throwsException);
    });
  });
}
