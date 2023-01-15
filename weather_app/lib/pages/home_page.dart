import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// usually the class name is same as the class name
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller = TextEditingController();
  var tempCity = "";
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WEATHER APP"),
        centerTitle: true,
        //backgroundColor: Colors.white30, // change it
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(children: [
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
                height: 90,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    var response = await Dio().get(
                        "http://api.weatherstack.com/current?access_key=0f3b6f30a30d68a0cdf219c6625732c9&query=${Controller.text}");

                    final temp = response.data["current"][
                        "temperature"]; // to get only the temp from the JSON as key value pair

                    setState(() {
                      tempCity = temp.toString();
                      isLoading = false;
                    });
                    print(temp);
                  } catch (error) {
                    print(error);
                  }
                },
                icon: Icon(Icons.search),
                label: Text("Search"),
              ),
              SizedBox(
                height: 90,
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
