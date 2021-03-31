import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Les scrollables'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Activite> mesActivite = [
    Activite('velo', Icons.directions_bike),
    Activite('peinture', Icons.palette),
    Activite('golf', Icons.golf_course),
    Activite('arcade', Icons.gamepad),
    Activite('bricolage', Icons.build),
    Activite('velo', Icons.directions_bike),
    Activite('peinture', Icons.palette),
    Activite('golf', Icons.golf_course),
    Activite('arcade', Icons.gamepad),
    Activite('bricolage', Icons.build),
    Activite('velo', Icons.directions_bike),
    Activite('peinture', Icons.palette),
    Activite('golf', Icons.golf_course),
    Activite('arcade', Icons.gamepad),
    Activite('bricolage', Icons.build),
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    print(orientation); 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (orientation == Orientation.portrait) ? liste() : grid()
      ),
    );
  }

  Widget liste() {
    return ListView.builder(
      itemCount: mesActivite.length,
      itemBuilder: (context, i) {
        Activite activite = mesActivite[i];
        String key = activite.nom;
        return Dismissible(
          key: Key(key),
          child: Container(
            height: 125,
            padding: EdgeInsets.all(5),
            child: Card(
              elevation: 7.5,
              child: InkWell(
                onTap: () => print('Tapped'),
                onLongPress: () => print('Cest looongg !'),
                child: Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      activite.icon,
                      color: Colors.orange,
                      size: 75
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Activite:',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 20
                          ),
                        ),
                        Text(
                          activite.nom,
                          style: TextStyle(
                            color: Colors.orange[700],
                            fontSize: 30,
                          ),
                        )
                      ],)
                  ],)
                )
              )
            ),
          ),
          background: Container(
            padding: EdgeInsets.only(right: 20),
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Supprimer',
                  style: TextStyle(
                    color: Colors.white,
                  )
                ),
                Icon(
                  Icons.delete,
                  color: Colors.white,
                )
              ],
            )
          ),
          onDismissed: (direction) {
            setState((){
              print('${activite.nom}');
              mesActivite.removeAt(i);
            });
          },
        );
      }
    );
  }

  Widget grid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: mesActivite.length,
      itemBuilder: (context, i){
        return Container(
          margin: EdgeInsets.all(7.5),
          child: Card(
            elevation: 10,
            child: InkWell(
              onTap: () => print('Tap grid'),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Activite', style: TextStyle(color: Colors.teal, fontSize: 15)),
                  Icon(mesActivite[i].icon, color: Colors.teal, size: 40),
                  Text(mesActivite[i].nom, style: TextStyle(color: Colors.teal[800], fontSize: 20))
                ],
              ),
            )
          )
        );
      },
    );
  }
}


class Activite {
  String nom;
  IconData icon;

  Activite(this.nom, this.icon);
}