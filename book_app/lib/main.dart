// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/rendering.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    title: 'Books by Lucifer',
    home: Home(),
  ));

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const CircleAvatar(
                      radius: 50.0,
                      child: ClipRRect(
                        child: Image(image: AssetImage('assets/lucifer.jpg')),
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Row(
                      children: const <Widget>[
                        SizedBox(width: 16.0,),
                        Text(
                          'Lucifer',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontFamily: 'SupermercadoOne',
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ),
              const ListTile(
                title: Text('Call me @ +91 8756260980'),
              ),
              const ListTile(
                title: Text('Send Email @ adnankhanmgdp@gmail.com'),
              ),
            ],
          ),
      ),
      appBar: AppBar(
        title: const Text(
          'Books By Lucifer',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 3.0,
                color: Color.fromARGB(255,0, 0, 0),
              ),
              Shadow(
                offset: Offset(2.0, 2.0),
                blurRadius: 8.0,
                color: Color.fromARGB(125, 255, 255, 255),
              ),
            ],
            fontFamily: 'SupermercadoOne',
          ),
        ),
      backgroundColor: Colors.red[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 10.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('assets/JAVA.webp'),
                      // width: 120.0,
                    ),
                    RaisedButton(
                      onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/JAVA.pdf','Java.pdf'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      child: const Text(
                          'View PDF',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      color: Colors.blue[400],
                    ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('assets/C SHARP.webp'),
                      // width: 120.0,
                    ),
                    RaisedButton(
                      onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/C%20SHARP.pdf','C_sharp.pdf'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      child: const Text(
                        'View PDF',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      color: Colors.blue[400],
                    ),
                  ]),
              ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('assets/CSS.webp'),
                      // width: 120.0,
                    ),
                    RaisedButton(
                      onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/CSS.pdf','Css.pdf'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      child: const Text(
                        'View PDF',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      color: Colors.blue[400],
                    ),
                    ]),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Image(
                      image: AssetImage('assets/PYTHON.webp'),
                      // width: 120.0,
                    ),
                    RaisedButton(
                      onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/PYTHON.pdf','Python.pdf'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0),
                      ),
                      child: const Text(
                        'View PDF',
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      color: Colors.blue[400],
                    ),
            ]),
              ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                  const Image(
                    image: AssetImage('assets/C.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/C.pdf','C.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                      ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                  const Image(
                    image: AssetImage('assets/JS.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/JS.pdf','JavaScript.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                      ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                  const Image(
                    image: AssetImage('assets/GIT.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/GIT.pdf','Git.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                      ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                  const Image(
                    image: AssetImage('assets/ANDROID.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/ANDROID.pdf','Android.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                      ]),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
              Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Image(
                    image: AssetImage('assets/C++.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/C++.pdf','Cpp.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                ]),
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Image(
                    image: AssetImage('assets/HTML5.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/HTML5.pdf','Html5.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                ]),
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Image(
                    image: AssetImage('assets/LINUX.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/LINUX.pdf','Linux.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                ]),
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Image(
                    image: AssetImage('assets/IOS.webp'),
                    // width: 120.0,
                  ),
                  RaisedButton(
                    onPressed: ()=>downloader('https://adnankhanmgdp.github.io/Programming-books/IOS.pdf','Ios.pdf'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45.0),
                    ),
                    child: const Text(
                      'View PDF',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    color: Colors.blue[400],
                  ),
                ]),
              ),
                ],
              ),
            ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.amber[100],
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>downloader('https://github.com/adnankhanmgdp/', 'Lucifer'),
        child: Icon(
          Icons.person_outline_rounded,
          size: 33.0,
          color: Colors.amber[100],
        ),
        backgroundColor: Colors.red[400],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[400],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3.0),
              child: const Text(
                '~ Dev (Lucifer)',
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 10.0,
                  fontFamily: 'IndieFlower',
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
Future downloader(String url,String name) async
{
  if (!await launch(url)) throw 'Could not launch $url';
  return 0;
}