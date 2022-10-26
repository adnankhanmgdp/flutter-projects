import 'dart:math';
import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class MainActivity extends StatefulWidget {
  Map<String, dynamic> note;
  MainActivity(this.note, {Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  bool done = false;
  List<Color> taskcol = [
    const Color.fromARGB(255, 255, 182, 176),
    const Color.fromARGB(255, 180, 255, 182),
    const Color.fromARGB(255, 241, 163, 255),
    const Color.fromARGB(255, 255, 229, 150),
    const Color.fromARGB(255, 168, 181, 255),
    Colors.white
  ];
  late Map<String, dynamic> data;
  late List<String> datakeys;
  bool showdesc = false;
  final _random = Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = json.decode(widget.note['data']);
    datakeys = data.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
            onTap: () {
              setState(() {
                showdesc = !showdesc;
              });
            },
            child: AutoSizeText(widget.note['title'])),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: const Center(child: Text("Back")),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
          child: Timeline.tileBuilder(
            theme: TimelineThemeData(
                nodePosition: 0.25,
                connectorTheme: ConnectorThemeData(
                  space: 5.0, color: Colors.amber[400],
                  // Colors.primaries[_random.nextInt(Colors.primaries.length)]
                  //     [_random.nextInt(9) * 100],
                ),

                // Colors.primaries[_random.nextInt(Colors.primaries.length)]
                //     [_random.nextInt(9) * 100],
                indicatorTheme: const IndicatorThemeData(
                  color: Colors.blueGrey,
                  position: 0.5,
                  size: 15.0,
                )),
            builder: TimelineTileBuilder(
              // indicatorStyle: IndicatorStyle.outlined,
              indicatorBuilder: ((context, index) => (DateFormat("HH:mm")
                          .format(DateTime.now())
                          .compareTo(DateFormat("HH:mm")
                              .format(DateFormat.jm().parse(datakeys[index]))) >
                      0)
                  ? Indicator.dot(
                      color: Colors.blueGrey,
                    )
                  : Indicator.outlined(
                      color: Colors.blueGrey,
                    )),
              startConnectorBuilder: ((context, index) => (DateFormat("HH:mm")
                          .format(DateTime.now())
                          .compareTo(DateFormat("HH:mm")
                              .format(DateFormat.jm().parse(datakeys[index]))) >
                      0)
                  ? Connector.solidLine(
                      color: Colors.blueGrey,
                    )
                  : Connector.solidLine()),

              endConnectorBuilder: ((context, index) => (DateFormat("HH:mm")
                          .format(DateTime.now())
                          .compareTo(DateFormat("HH:mm")
                              .format(DateFormat.jm().parse(datakeys[index]))) >
                      0)
                  ? Connector.solidLine(
                      color: Colors.blueGrey,
                    )
                  : Connector.solidLine()),
              contentsAlign: ContentsAlign.basic,
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                child: Text(datakeys[index]),
              ),
              contentsBuilder: (context, index) => Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Card(
                  color: taskcol[data[datakeys[index]][1]],
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(data[datakeys[index]][0]),
                  ),
                ),
              ),
              itemCount: data.length,
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(
            msg: "This feature will be added soon!",
            toastLength: Toast.LENGTH_LONG,
          );
        },
        tooltip: "Edit your schedule",
        hoverColor: Colors.blueGrey[600],
        hoverElevation: 0.6,
        child: const Icon(Icons.edit_outlined),
      ),
      bottomNavigationBar: (showdesc)
          ? BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(widget.note['description']),
              ),
            )
          : const BottomAppBar(),
    );
  }
}
