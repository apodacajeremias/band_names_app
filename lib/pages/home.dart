// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:band_names/models/band.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'ABBA', votes: 5),
    Band(id: '2', name: 'Boney M.', votes: 10),
    Band(id: '3', name: 'The Weather Girls', votes: 15),
    Band(id: '4', name: 'Metallica', votes: 20),
    Band(id: '5', name: 'Queen', votes: 25),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'BandNames',
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
        ));
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print('direction: $direction');
        print('band: ${band.id}');
        //Llamar borrado el server
      },
      background: Container(
        padding: EdgeInsets.only(left: 8),
          color: Colors.red,
          child: Align(
              alignment: Alignment.centerLeft, child: Text('Delete Band', style: TextStyle(color: Colors.white)))),
      child: ListTile(
        leading: CircleAvatar(
            backgroundColor: Colors.blue[100],
            child: Text(band.name.substring(0, 2))),
        title: Text(band.name),
        trailing: Text('${band.votes}', style: TextStyle(fontSize: 20)),
        onTap: () {
          print(band.name);
        },
      ),
    );
  }

  addNewBand() {
    final textController = TextEditingController();
    // if (Platform.isIOS) {
    //   return showCupertinoDialog(git 
    //     context: context,
    //     builder: (context) {
    //       return CupertinoAlertDialog(
    //         title: Text('New band name'),
    //         content: CupertinoTextField(controller: textController),
    //         actions: [
    //           CupertinoDialogAction(
    //               isDefaultAction: true,
    //               onPressed: () => addBandToList(textController.text),
    //               child: Text('Add')),
    //                CupertinoDialogAction(
    //               isDestructiveAction: true,
    //               onPressed: () => Navigator.pop(context),
    //               child: Text('Dismiss')),
    //         ],
    //       );
    //     },
    //   );
    // }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('New band name'),
          content: TextField(controller: textController),
          actions: [
            MaterialButton(
                elevation: 5,
                onPressed: () => addBandToList(textController.text),
                textColor: Colors.blue,
                child: Text('Add'))
          ],
        );
      },
    );
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      bands.add(Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {});
      // Podemos agregar
    }
    Navigator.pop(context);
  }
}
