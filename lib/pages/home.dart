// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:band_names_app/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: "01", name: "Metallica", votes: 5),
    Band(id: "02", name: "The Smiths", votes: 5),
    Band(id: "03", name: "Salário Minimom", votes: 5),
    Band(id: "04", name: "The 1989", votes: 5),
    Band(id: "05", name: "Salamandra", votes: 5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Band Names",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      background: Container(
        padding: EdgeInsets.all(8),
        color: Colors.red,
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Dismiss",
              style: TextStyle(color: Colors.white),
            )),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0, 2)),
        ),
        title: Text(band.name),
        trailing: Text(
          "${band.votes}",
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {},
      ),
    );
  }

  addNewBand() {
    final controller = TextEditingController();
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("New band name"),
        content: TextField(
          controller: controller,
        ),
        actions: [
          if (Platform.isIOS) ...{
            CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: addBandToList(controller.text),
                child: Text("Add")),
            CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () => Navigator.pop(context),
                child: Text("Dismiss")),
          } else ...{
            MaterialButton(
                textColor: Colors.blue,
                elevation: 5,
                onPressed: addBandToList(controller.text),
                child: Text("Add"))
          }
        ],
      ),
    );
  }

  addBandToList(String name) {
    bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
    Navigator.pop(context);
  }
}
