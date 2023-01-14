// making the home page

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// usually the class name is same as the class name
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Controller = TextEditingController();
  var tempCity = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),
        centerTitle: true,
        backgroundColor: Colors.white30,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
              child: TextField(
            controller: Controller,
            decoration: InputDecoration(
              hintText: "city name",
              labelText: "City Name",
            ),
          )),
        ),
        SizedBox(
          height: 100,
        ),
        ElevatedButton.icon(
          onPressed: () async {
            try {
              var response = await Dio().get(
                  "http://api.weatherstack.com/current?access_key=0f3b6f30a30d68a0cdf219c6625732c9&query=${Controller.text}");

              final temp = response.data["current"][
                  "temperature"]; // to get only the temp from the JSON as key value pair

              tempCity = temp;
              print(temp);
            } catch (error) {
              print(error);
            }
          },
          icon: Icon(Icons.search),
          label: Text("Search"),
        ),
        SizedBox(
          height: 100,
        ),
        Stack(
          // to make the widgets lay as stack (on top of each other)
          children: [
            Text(
              tempCity,
              style: TextStyle(
                fontSize: 100,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Positioned(
              right: 1,
              child: Text("o",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
            ),
          ],
        )
      ]),
    );
  }
}
