import 'package:dictionary/bloc/dictionary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dictCubit = context.watch<DictionaryCubit>();

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                  title: Text(
                "${index + 1} ${dictCubit.dictionaryData!.word.toString()}",
                style: const TextStyle(color: Colors.white),
              )),
          separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
          itemCount: dictCubit.dictionaryData!.phonetics!.length),
    );
  }
}
