import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:quotesapp/screens/second_screen.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String title = "Prosper";
  String tagText = "";
  String authorText = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              tagText,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text("- $authorText", style: TextStyle(fontSize: 18)),
              )),
          ElevatedButton(
            onPressed: () async {
              var url = Uri.parse(
                  'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');

              var response = await http.get(url);
              var data = jsonDecode(response.body);
              tagText = data["content"];
              authorText = data["author"];

              setState(() {});

              // var url = Uri.parse(
              //     'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');

              // var response = await http.get(url);
              // print('Response status ${response.statusCode}');
              // print('Response body ${response.body}');

              // var data = jsonDecode(response.body);
              // String tags = data["content"];
              // String author = data["author"];

              // //navigation
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>
              //         SecondScreen(tagText: tags, authorText: author)));
            },
            child: const Text("Get Quotes!"),
          ),
        ],
      ),
    ));
  }
}
