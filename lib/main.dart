import 'package:dictionary/bloc/dictionary_bloc.dart';
import 'package:dictionary/repository/word_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>
                  DictionaryCubit(WordRepository()))
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
           
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen()));
  }
}
