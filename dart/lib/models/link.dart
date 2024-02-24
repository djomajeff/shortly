// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class LinkModel extends Equatable {
  late final String original, shorten;

  LinkModel({
    required this.original,
    required this.shorten,
  });

  LinkModel.fromJson(Map<String, dynamic> json) {
    original = json['original'] ?? '';
    shorten = json['shorten'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['original'] = original;
    data['shorten'] = shorten;
    return data;
  }

  @override
  List<Object?> get props => [original, shorten];
}
