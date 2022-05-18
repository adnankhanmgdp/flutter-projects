import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Chats.dart';
void main() {
  runApp(const MaterialApp(
    home: Whatsapp_Chat(),
    debugShowCheckedModeBanner: false,
  ));
}
class Whatsapp_Chat extends StatefulWidget {
  const Whatsapp_Chat({Key? key}) : super(key: key);

  @override
  _Whatsapp_ChatState createState() => _Whatsapp_ChatState();
}

class _Whatsapp_ChatState extends State<Whatsapp_Chat> {
  List<Chats> chats = [
  Chats(name: 'Ravi Tiwari', chat: 'Aur Kaise ho bhai', dp: 'assets/ravi.jpg'),
  Chats(name: 'Ammi Jaan', chat: 'Khana Khalo', dp: 'assets/ammi.jpg'),
  Chats(name: 'Deeksha', chat: 'Kal se college khul rhe hai', dp: 'assets/deeksha.jpg'),
  Chats(name: 'Behen', chat: 'Mere liye oreo lete aana', dp: 'assets/behen.jpg'),
  ];
  Widget cardTemplate(chat)
  {
    return Card(
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10.0),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: ()=>Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ProfilePic(
                    name: chat.name,
                    dp: chat.dp,
                  ))
                ),
                child: Hero(
                  tag: "image",
                  child: CircleAvatar(
                    backgroundImage: AssetImage(chat.dp),
                  ),
                ),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(chat.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.check,
                        size: 15.0,
                      ),
                      const SizedBox(width: 4.0),
                      Text(chat.chat,
                        style: const TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        toolbarHeight: 50.0,
        elevation: 0.0,
        title: Row(
          children: const <Widget>[
            Image(image: AssetImage('assets/whatsapp-1-removebg-preview.png'),
            width: 35.0,
            ),
            SizedBox(width: 15.0),
            Text(
              'WhatsApp',

            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                      color: Colors.green[800],
                  child: const Text('Chats'),
                )),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                      color: Colors.green[700],
                  child: const Text('Status'),
                )),
                Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 20.0),
                      color: Colors.green[700],
                  child: const Text('Calls'),
                ))
              ],
            ),
            Column(
              children: chats.map((chat) => cardTemplate(chat)).toList(),
            )
          ],
        ),
      ),
    );
  }
}
class ProfilePic extends StatefulWidget {
  final String name, dp;
  const ProfilePic({Key? key, required this.name, required this.dp}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text(widget.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Hero(
          tag: "image",
          child: CircleAvatar(
            radius: 200.0,
            backgroundImage: AssetImage(widget.dp),
          ),
        ),
      ),
    );
  }
}
