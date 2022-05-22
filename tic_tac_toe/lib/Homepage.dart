import 'package:flutter/material.dart';
import 'package:tic_tac_toe/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AssetImage cross = AssetImage('images/cross.png');
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage edit = AssetImage('images/edit.png');

  late List<String> gameState;
  bool iscross = true;
  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      this.gameState  = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty'
      ];
    });
    this.message = "New Game";
  }

  void resetGame()
  {
    setState(() {
      this.gameState = [
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty',
        'empty'
      ];
    });
    this.message = "New Game";
  }

  playGame(int index)
  {
    if(this.gameState[index]=='empty')
    {
      setState(() {
        if(this.iscross)
        {
          this.gameState[index]='cross';
        }
        else {
          this.gameState[index] = 'circle';
        }
        this.checkWin();
        this.iscross = !this.iscross;
      });
    }
  }

  AssetImage setImage(String value)
  {
    switch(value)
    {
      case ('empty'):
        return edit;
      case ('circle'):
        return circle;
      case ('cross'):
        return cross;
      default:
        return edit;
    }
  }

  void checkWin()
  {
    int i,flag = 0;
    if(gameState[0]=='cross'&& gameState[1]=='cross' && gameState[2] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[3]=='cross'&& gameState[4]=='cross' && gameState[5] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[6]=='cross'&& gameState[7]=='cross' && gameState[8] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[0]=='cross'&& gameState[3]=='cross' && gameState[6] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[1]=='cross'&& gameState[4]=='cross' && gameState[7] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[2]=='cross'&& gameState[5]=='cross' && gameState[8] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[0]=='cross'&& gameState[4]=='cross' && gameState[8] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[2]=='cross'&& gameState[4]=='cross' && gameState[6] == 'cross')
    {
      message = "Cross Win";
      flag = 1;
    }
    else if(gameState[0]=='circle'&& gameState[1]=='circle' && gameState[2] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(gameState[3]=='circle'&& gameState[4]=='circle' && gameState[5] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(gameState[6]=='circle'&& gameState[7]=='circle' && gameState[8] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(gameState[0]=='circle'&& gameState[3]=='circle' && gameState[6] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(gameState[1]=='circle'&& gameState[4]=='circle' && gameState[7] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(gameState[2]=='circle'&& gameState[5]=='circle' && gameState[8] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(gameState[0]=='circle'&& gameState[4]=='circle' && gameState[8] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(gameState[2]=='circle'&& gameState[4]=='circle' && gameState[6] == 'circle')
    {
      message = "Circle Win";
      flag = 1;
    }
    else if(!gameState.contains('empty'))
    {
      message = 'Game Draw';
    }
    else
    {
      message = "";
    }
    setState(() {
      this.message = message;
    });
    if(flag == 1)
    {
      for(i = 0; i < gameState.length;i++)
      {
        if(gameState[i]=='empty')
        {
          gameState[i]='false';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Colors.deepOrange[200],
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                  ), 
                  itemCount: gameState.length,
                  itemBuilder: (context,i) => SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                        color: Colors.deepOrange[100],
                      ),
                      // color: Colors.deepOrange[100],
                      child: MaterialButton(
                          onPressed: ()=>this.playGame(i),
                          child: Image(
                            image: setImage(this.gameState[i]),
                          ),
                        ),
                    ),
                  )
                  ),
              ),
              const SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                    message ,
                    style: const TextStyle(
                      color: Colors.black,
                      backgroundColor: Colors.amber,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
              const SizedBox(height: 20.0,),
              RaisedButton(onPressed: resetGame,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                child: Text(
                  'Reset game',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
              ),
              const SizedBox(height: 100.0)
          ],),
        ),
      )
    );
  }
}