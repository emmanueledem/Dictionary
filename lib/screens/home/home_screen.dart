import 'package:dictionary/bloc/dictionary_bloc.dart';
import 'package:dictionary/screens/list/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  getDictionaryFormWidget(BuildContext context) {
    final dictCubit = context.watch<DictionaryCubit>();

    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Spacer(),
          const Text(
            'Dictionary App',
            style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
                fontSize: 34),
          ),
          const Text(
            'Search any word you want quickly',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
            controller: dictCubit.queryController,
            decoration: const InputDecoration(
              hintText: 'Search a word',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              filled: true,
              fillColor: Colors.grey,
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  dictCubit.getWordSearched();
                },
                style:
                    ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent),
                child: const Text("SEARCH")),
          )
        ]));
  }

  getLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message) {
    return Center(child: Text(message));
  }

  @override
  Widget build(BuildContext context) {
    final dictCubit = context.watch<DictionaryCubit>();

    return BlocListener(
      listener: (context, state) {
        if (state is WordSearchedState) {
          dictCubit.queryController.clear();
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const ListScreen())));
        }
      },
      bloc: dictCubit,
      child: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: dictCubit.state is WordSearchingState
              ? getLoadingState()
              : dictCubit.state is ErrorState
                  ? getErrorWidget("Some Error")
                  : dictCubit.state is NoWordSearchedState
                      ? getDictionaryFormWidget(context)
                      : Container()),
    );
  }
}
