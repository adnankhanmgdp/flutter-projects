import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AssetImage> images = [
                              const AssetImage('flimages/images/one.png'),
                              const AssetImage('flimages/images/two.png'),
                              const AssetImage('flimages/images/three.png'),
                              const AssetImage('flimages/images/four.png'),
                              const AssetImage('flimages/images/five.png'),
                              const AssetImage('flimages/images/six.png')
                            ];
  AssetImage diceimage1 = const AssetImage('flimages/images/one.png');
  AssetImage diceimage2 = const AssetImage('flimages/images/one.png');
  int dienumber1 = 0;
  int dienumber2 = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    diceimage1 = images[0];
    dienumber1 = 1;
    dienumber2 = 1;
  }

  void RollDie()
  {
    int indx1 = Random().nextInt(6);
    int indx2 = Random().nextInt(6);
    setState(() {
      diceimage1 = images[indx1];
      diceimage2 = images[indx2];
      diceimage2 = images[indx2];
      dienumber1 = indx1 + 1;
      dienumber2 = indx2 + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('Roll a Dice',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$dienumber1 + $dienumber2 = '+(dienumber1+dienumber2).toString(),
                style: TextStyle(
                  color: Colors.blueGrey[800],
                  fontSize: 40.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Expanded(
                        flex: 5,
                          child: Image(
                          image: diceimage1,
                          width: 150.0,
                        ),
                      ),
                    const Expanded(flex: 1,child: SizedBox(width: 20.0)),
                      Expanded(
                        flex: 5,
                          child: Image(
                          image: diceimage2,
                          width: 150.0,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 50.0,),
              RaisedButton(
                onPressed: RollDie,
                color: Colors.orange[900],
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
                  child: Text('Roll It!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
              )
            ],
          ),
        ),
      ),
    );
  }
}