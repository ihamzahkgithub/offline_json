import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:culms/Views/theme.dart'; // Import your theme controller

class LandingScreen extends StatelessWidget {
  final ThemeController _themeController =
      Get.find(); // Get the theme controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JSON DATA",
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: _themeController.isDarkMode.value
            ? Colors.black // Set dark theme app bar color
            : Colors.blue, // Set light theme app bar color
        actions: [
          IconButton(
            icon: Obx(() {
              return _themeController.isDarkMode.value
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode);
            }),
            onPressed: () {
              _themeController.toggleTheme();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("load_json/person.json"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                  ),
                );
              } else {
                var mydata = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemCount: mydata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          "Name: ${mydata[index]["name"]}",
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Age: ${mydata[index]["age"]}"),
                            Text("Address: ${mydata[index]["address"]}"),
                            Text("Hair Color: ${mydata[index]["hair_color"]}"),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
