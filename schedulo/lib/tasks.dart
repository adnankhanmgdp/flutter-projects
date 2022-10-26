import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:schedules/addnote.dart';
import 'package:schedules/dbhelpers/helper.dart';
import 'package:schedules/home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  late NotesDatabase db;
  List<dynamic> alltasks = [];
  bool isloading = true;
  bool nodata = true;

  void _settasks() async {
    await db.initDatabase();
    alltasks = await db.getAllNotes();
    await db.closeDatabase();
    setState(() {
      alltasks = alltasks;
      print(alltasks);
      isloading = false;
      nodata = (alltasks.isEmpty) ? true : false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db = NotesDatabase();
    _settasks();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedulo'),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddNotePage(alltasks.length)),
              ).then((value) => _settasks());
            }),
            child: Row(
              children: const [
                Icon(Icons.add_circle_outline),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Create"),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 5.0),
          child: (!isloading && nodata)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/nodata.jpg"),
                    const Text(
                      "Your schedules will appear here",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1),
                    )
                  ],
                )
              : ListView.builder(
                  itemCount: alltasks.length,
                  itemBuilder: ((context, index) => Card(
                        child: ListTile(
                          leading: alltasks[index]['priority'] == 0
                              ? IconButton(
                                  icon: const Icon(Icons.star_border_outlined),
                                  onPressed: () {
                                    changePriority(alltasks[index]['id'], 0);
                                  },
                                )
                              : IconButton(
                                  onPressed: () {
                                    changePriority(alltasks[index]['id'], 1);
                                  },
                                  icon: Icon(
                                    Icons.star,
                                    color: Colors.yellow[600],
                                  )),
                          title: Text(alltasks[index]['title']),
                          subtitle: AutoSizeText(
                            alltasks[index]['description'],
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Map<String, dynamic> note = alltasks[index];

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainActivity(note)),
                            );
                          },
                          trailing: PopupMenuButton(
                            constraints: const BoxConstraints(maxWidth: 120),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 'edit$index',
                                  onTap: () {
                                    Fluttertoast.showToast(
                                      msg: "This feature will be added soon!",
                                      toastLength: Toast.LENGTH_LONG,
                                    );
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(Icons.mode_edit_outline_outlined),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text("Edit")
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                    value: '',
                                    // onTap: (() {
                                    //   deletetask(alltasks[index]['id']);
                                    // }),
                                    onTap: () {
                                      Future.delayed(
                                          const Duration(seconds: 0),
                                          () => showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  // title: const Text("Are you sure to leave?"),
                                                  content: const Text(
                                                      "Are you sure you want to delete this schedule?"),
                                                  contentTextStyle:
                                                      const TextStyle(
                                                          color:
                                                              Colors.blueGrey),
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          24, 24, 24, 6),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: (() async {
                                                            NotesDatabase note =
                                                                NotesDatabase();
                                                            await note
                                                                .initDatabase();
                                                            await note.deleteNote(
                                                                alltasks[index]
                                                                    ['id']);
                                                            _settasks();
                                                            Navigator.pop(
                                                                context);
                                                          }),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    10,
                                                                    8,
                                                                    15,
                                                                    8),
                                                            child: Text(
                                                              "YES",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .amber[
                                                                      700],
                                                                  fontSize:
                                                                      12.0),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    15,
                                                                    8,
                                                                    15,
                                                                    8),
                                                            child: Text(
                                                              "NO",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .amber[
                                                                      700],
                                                                  fontSize:
                                                                      12.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ));
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.delete_outline),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text("Delete")
                                      ],
                                    )),
                              ];
                            },
                            onSelected: (String value) {
                              print('You Click on $value');
                            },
                          ),
                        ),
                      )))),
    );
  }

  void changePriority(int id, int priority) async {
    priority = priority == 0 ? 1 : 0;
    await db.initDatabase();
    await db.updatePriority(id, priority);
    await db.closeDatabase();
    _settasks();
  }
}
