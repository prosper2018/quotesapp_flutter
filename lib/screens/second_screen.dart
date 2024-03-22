import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatelessWidget {
  String tagText;
  String authorText;

  SecondScreen({super.key, required this.tagText, required this.authorText});

  @override
  Widget build(BuildContext context) {
    // print('Response status ${authorText}');
    // print('Response body ${tagText}');

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Column(children: [
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
                  // var url = Uri.https(
                  //     'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');
                  // var response = await http.get(url);
                  // print('Response status: ${response.statusCode}');
                  // print('Response body: ${response.body}');

                  var url = Uri.parse(
                      'https://api.quotable.io/random?tags=technology%2Cfamous-quotes');

                  var response = await http.get(url);
                  print('Response status ${response.statusCode}');
                  print('Response body ${response.body}');

                  print('Response body: ');

                  // print(
                  //     await http.read(Uri.https('example.com', 'foobar.txt')));
                },
                child: const Text("Get Next Quotes!"))
          ])),
    );
  }
}
