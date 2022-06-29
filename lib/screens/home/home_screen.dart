import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  getDictionaryFormWidget() {
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
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 32,
          ),
          const TextField(
            decoration: InputDecoration(
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
                onPressed: () {},
                style:
                    ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent),
                child: const Text("SEARCH")),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: getDictionaryFormWidget(),
    );
  }
}
