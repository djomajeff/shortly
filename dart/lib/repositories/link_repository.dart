import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shortly/models/link.dart';
import 'package:shortly/utils/utils.dart';

class LinkRepository {
  final _storage = const FlutterSecureStorage();
  final _dio = Dio(
    BaseOptions(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  void setApiKey(String value) {
    _dio.options.headers['api-key'] = value;
  }

  Future<List<LinkModel>> getShortedLinks() async {
    final data = await _storage.read(key: kLocalLinks);
    if (data != null) {
      final decoded = jsonDecode(data) as List;
      final links = decoded.map((link) => LinkModel.fromJson(link)).toList();
      return links;
    }
    return [];
  }

  Future<String> shortenLink(String value) async {
    final response = await _dio.post(
      'https://shrtlnk.dev/api/v2/link',
      data: {'url': value},
    );
    final shortedLink = response.data['shrtlnk'];
    await _storeLink(LinkModel(original: value, shorten: shortedLink));

    return shortedLink;
  }

  Future<void> _storeLink(LinkModel link) async {
    final links = await getShortedLinks();
    links.add(link);
    await _storage.write(
      key: kLocalLinks,
      value: jsonEncode(links),
    );
  }
}
