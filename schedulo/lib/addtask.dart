import 'package:flutter/material.dart';

class AddTaskField extends StatefulWidget {
  int indx = 0;
  int taskcolor = 5;
  String time = "";
  String detail = "";
  AddTaskField(int n, {Key? key}) : super(key: key) {
    indx = n;
  }
  @override
  State<AddTaskField> createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  int a = 0;
  List<int> col = [0, 0, 0, 0, 0];
  String sctime = "";
  var txt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    a = widget.indx + 1;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task $a",
                  style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 23,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            TextFormField(
              autocorrect: false,
              cursorWidth: 2,
              cursorColor: Colors.amber,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelStyle: TextStyle(letterSpacing: 1),
                  labelText: "Task Details"),
              // The validator receives the text that the user has entered.
              validator: (value) {
                value = value!.trim();
                widget.detail = value;
                if (value.isEmpty) {
                  return "Please enter description for note";
                }
                if (value.length > 50) {
                  return "Maximum 50 characters";
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  controller: txt,
                  autocorrect: false,
                  cursorWidth: 2,
                  cursorColor: Colors.amber,
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelStyle: TextStyle(letterSpacing: 1),
                      labelText: "Time",
                      constraints: BoxConstraints(maxWidth: 100)),
                  readOnly: true,
                  // The validator receives the text that the user has entered.
                  onTap: () async {
                    var pickedTime = await showTimePicker(
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );

                    if (pickedTime != null) {
                      print(pickedTime.format(context)); //output 10:51 PM
                      var parsedTime = (pickedTime.format(context).toString());
                      setState(() {
                        sctime = parsedTime;
                        txt.text = sctime;
                        widget.time = sctime;
                      });
                    } else {
                      print("Time is not selected");
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        for (var i = 0; i < 5; i++) {
                          col[i] = 0;
                        }
                        setState(() {
                          widget.taskcolor = 0;
                          col[0] = 1;
                        });
                      },
                      iconSize: 25,
                      icon: Icon(
                          (col[0] == 1) ? Icons.check_circle : Icons.circle),
                      color: Colors.red,
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        for (var i = 0; i < 5; i++) {
                          col[i] = 0;
                        }
                        setState(() {
                          widget.taskcolor = 1;
                          col[1] = 1;
                        });
                      },
                      iconSize: 25,
                      icon: Icon(
                          (col[1] == 1) ? Icons.check_circle : Icons.circle),
                      color: Colors.green,
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        for (var i = 0; i < 5; i++) {
                          col[i] = 0;
                        }
                        setState(() {
                          widget.taskcolor = 2;
                          col[2] = 1;
                        });
                      },
                      iconSize: 25,
                      icon: Icon(
                          (col[2] == 1) ? Icons.check_circle : Icons.circle),
                      color: Colors.purple,
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        for (var i = 0; i < 5; i++) {
                          col[i] = 0;
                        }
                        setState(() {
                          widget.taskcolor = 3;
                          col[3] = 1;
                        });
                      },
                      iconSize: 25,
                      icon: Icon(
                          (col[3] == 1) ? Icons.check_circle : Icons.circle),
                      color: Colors.orange,
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () {
                        for (var i = 0; i < 5; i++) {
                          col[i] = 0;
                        }
                        setState(() {
                          col[4] = 1;
                          widget.taskcolor = 4;
                        });
                      },
                      iconSize: 25,
                      icon: Icon(
                          (col[4] == 1) ? Icons.check_circle : Icons.circle),
                      color: Colors.indigo,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
