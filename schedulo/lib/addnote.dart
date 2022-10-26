import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schedules/dbhelpers/helper.dart';
import 'package:schedules/dbhelpers/note.dart';
import 'addtask.dart';
import 'dart:convert';

class AddNotePage extends StatefulWidget {
  int id;
  AddNotePage(this.id, {Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String title = "";
  String desc = "";
  int prior = 0;
  late List<AddTaskField> _taskField = [];
  var textcontroller = TextEditingController();
  int taskcount = 1;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final back = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            // title: const Text("Are you sure to leave?"),
            content: const Text("Are you sure to leave?"),
            contentTextStyle: const TextStyle(color: Colors.blueGrey),
            contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.pop(context, true);
                    }),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text(
                        "YES",
                        style:
                            TextStyle(color: Colors.amber[700], fontSize: 12.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() => Navigator.pop(context, false)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      child: Text(
                        "NO",
                        style:
                            TextStyle(color: Colors.amber[700], fontSize: 12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        return back;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Add a new Note')),
          elevation: 0,
          leading: GestureDetector(
              onTap: () async {
                final back = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    // title: const Text("Are you sure to leave?"),
                    content: const Text("Are you sure to leave?"),
                    contentTextStyle: const TextStyle(color: Colors.blueGrey),
                    contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 6),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              Navigator.pop(context, true);
                            }),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 8, 15, 8),
                              child: Text(
                                "YES",
                                style: TextStyle(
                                    color: Colors.amber[700], fontSize: 12.0),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (() => Navigator.pop(context, false)),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                              child: Text(
                                "NO",
                                style: TextStyle(
                                    color: Colors.amber[700], fontSize: 12.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                if (back) {
                  Navigator.pop(context);
                }
              },
              child: const Center(child: Text("Back"))),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: const Center(child: Text("Save")),
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_taskField.isEmpty) {
                        setState(() {
                          taskcount = 0;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Please add some tasks')),
                        );
                      } else {
                        bool notime = false;
                        for (int i = 0; i < _taskField.length; i++) {
                          if (_taskField[i].time == "") {
                            notime = true;
                          }
                        }
                        if (notime) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Time is not assigned to some task')),
                          );
                        } else {
                          // print(title);
                          // print(desc);
                          // print(prior);
                          Map<String, List<dynamic>> a = {};
                          for (var w in _taskField) {
                            a[w.time] = <dynamic>[w.detail, w.taskcolor];
                          }
                          // print(a);

                          Note note = Note(
                              id: widget.id,
                              title: title,
                              description: desc,
                              priority: prior,
                              data: json.encode(a));
                          // print(note.toString());

                          NotesDatabase notedb = NotesDatabase();
                          await notedb.initDatabase();
                          int res = await notedb.insertNote(note);
                          await notedb.closeDatabase();
                          Fluttertoast.showToast(
                            msg: "Your Tasks are saved successfullly",
                            toastLength: Toast.LENGTH_LONG,
                          );
                          Navigator.pop(context);
                        }
                      }
                    }
                  }),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFormField(
                                controller: textcontroller,
                                autocorrect: false,
                                cursorWidth: 2,
                                cursorColor: Colors.amber,
                                decoration: InputDecoration(
                                    constraints: BoxConstraints(
                                        maxWidth: 2.5 *
                                            MediaQuery.of(context).size.width /
                                            4),
                                    border: const UnderlineInputBorder(),
                                    labelStyle:
                                        const TextStyle(letterSpacing: 1),
                                    labelText: "Title"),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  value = value!.trim();
                                  title = value;
                                  if (value.isEmpty) {
                                    return "Please enter title for note";
                                  }
                                  if (value.length > 30) {
                                    return "Maximum 30 characters";
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              ),
                              DropdownButtonFormField(
                                  focusColor: Colors.white,
                                  decoration: InputDecoration(
                                      hintText: "Priority",
                                      constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4)),
                                  isDense: true,
                                  value: "Normal",
                                  items: ["Normal", "High"].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    if (value == "Normal") {
                                      prior = 0;
                                    } else {
                                      prior = 1;
                                    }
                                  }),
                            ],
                          ),
                          TextFormField(
                            // maxLines: 2,
                            autocorrect: false,
                            cursorWidth: 2,
                            cursorColor: Colors.amber,
                            decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelStyle: TextStyle(letterSpacing: 1),
                                labelText: "Description"),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              value = value!.trim();
                              desc = value;
                              if (value.isEmpty) {
                                return "Please enter description for note";
                              }
                              if (value.length > 60) {
                                return "Maximum 60 characters";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _taskField.length,
                    itemBuilder: (context, index) => _taskField[index],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      _taskField.add(AddTaskField(_taskField.length));
                      setState(() {
                        _taskField = _taskField;
                        taskcount += 1;
                      });
                    },
                    child: DottedBorder(
                      // color: Colors.grey,
                      color: (taskcount == 0)
                          ? const Color.fromARGB(255, 255, 119, 109)
                          : Colors.grey,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 5, 10, 5, 10, 5],
                      child: Container(
                        color: (taskcount == 0)
                            ? const Color.fromARGB(255, 255, 233, 232)
                            : Colors.grey[100],
                        // color: Colors.grey[100],
                        width: MediaQuery.of(context).size.width - 30,
                        height: 80,
                        child: Center(
                            child: Text(
                          "Add New Task",
                          style: TextStyle(
                              color: (taskcount == 0)
                                  ? const Color.fromARGB(255, 235, 125, 118)
                                  : Colors.grey,
                              fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
