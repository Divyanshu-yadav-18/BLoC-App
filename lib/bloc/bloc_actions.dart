import 'package:bloc_app/bloc/person.dart';
import 'package:flutter/foundation.dart';

const person1Url = 'http://127.0.0.1:5500/bloc_app/api/persons1.json';
const person2Url = 'http://127.0.0.1:5500/bloc_app/api/persons2.json';

typedef PersonLoader = Future<Iterable<Person>> Function(String url);

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoarPersonAction extends LoadAction {
  final String url;
  final PersonLoader loader;

  const LoarPersonAction({
    required this.url,
    required this.loader,
  }) : super();
}
