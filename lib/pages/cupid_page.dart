import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:math' as math show Random;

const names = ['optimus', 'bumblebee', 'megatron', 'starscream'];

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NameCubit extends Cubit<String?> {
  NameCubit() : super(null);

  void pickRandomName() => emit(
        names.getRandomElement(),
      );
}

class CupidPage extends StatefulWidget {
  const CupidPage({super.key});

  @override
  State<CupidPage> createState() => _CupidPageState();
}

class _CupidPageState extends State<CupidPage> {
  late final NameCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = NameCubit();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<String?>(
            stream: cubit.stream,
            builder: (context, snapshot) {
              final button = TextButton(
                onPressed: () => cubit.pickRandomName(),
                child: const Text("Pick a random Name"),
              );
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return button;
                case ConnectionState.waiting:
                  return button;
                case ConnectionState.active:
                  return Column(
                    children: [Text(snapshot.data ?? ''), button],
                  );
                case ConnectionState.done:
                  return const SizedBox();
              }
            }));
  }
}
