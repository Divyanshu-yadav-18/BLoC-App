import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoarPersonAction extends LoadAction {
  final PersonsUrl url;

  const LoarPersonAction({required this.url}) : super();
}

enum PersonsUrl {
  person1,
  person2,
}

extension UrlString on PersonsUrl {
  String get urlString {
    switch (this) {
      case PersonsUrl.person1:
        return 'http://127.0.0.1:5500/bloc_app/api/persons1.json';
      case PersonsUrl.person2:
        return 'http://127.0.0.1:5500/bloc_app/api/person2.json';
    }
  }
}

@immutable
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});
  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
