import 'package:bloc_app/bloc/bloc_actions.dart';
import 'package:bloc_app/bloc/person_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_app/bloc/person.dart';

const mockedPerson1 = [
  Person(
    name: 'Optimus',
    age: 1000,
  ),
  Person(
    name: 'Bumblebee',
    age: 500,
  )
];

const mockedPerson2 = [
  Person(
    name: 'Megatron',
    age: 1000,
  ),
  Person(
    name: 'StarScream',
    age: 500,
  )
];

Future<Iterable<Person>> mockGetPerson1(String _) =>
    Future.value(mockedPerson1);
Future<Iterable<Person>> mockGetPerson2(String _) =>
    Future.value(mockedPerson2);

void main() {
  group('Testing bloc', () {
    late PersonsBloc bloc;

    setUp(() {
      bloc = PersonsBloc();
    });

    blocTest<PersonsBloc, FetchResult?>(
      'Test Initial State',
      build: () => bloc,
      verify: (bloc) => bloc.state == null,
    );

    //fetch mock data (person1)
    blocTest<PersonsBloc, FetchResult?>("Mock retrieving Persons from first",
        build: () => bloc,
        act: (bloc) {
          bloc.add(
            const LoarPersonAction(
              url: 'dummy_url_1',
              loader: mockGetPerson1,
            ),
          );
          bloc.add(
            const LoarPersonAction(
              url: 'dummy_url_1',
              loader: mockGetPerson1,
            ),
          );
        },
        expect: () => [
              const FetchResult(
                persons: mockedPerson1,
                isRetrievedFromCache: false,
              ),
              const FetchResult(
                persons: mockedPerson1,
                isRetrievedFromCache: true,
              )
            ]);

    //fetch mock data (person1)
    blocTest<PersonsBloc, FetchResult?>("Mock retrieving Persons from first",
        build: () => bloc,
        act: (bloc) {
          bloc.add(
            const LoarPersonAction(
              url: 'dummy_url_1',
              loader: mockGetPerson1,
            ),
          );
          bloc.add(
            const LoarPersonAction(
              url: 'dummy_url_1',
              loader: mockGetPerson1,
            ),
          );
        },
        expect: () => [
              const FetchResult(
                persons: mockedPerson1,
                isRetrievedFromCache: false,
              ),
              const FetchResult(
                persons: mockedPerson1,
                isRetrievedFromCache: true,
              )
            ]);
  });
}
