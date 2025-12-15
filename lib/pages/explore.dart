import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:triply/widgets/exploregrids.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('assets/images/story/cm1.jpeg'),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        SizedBox(width: 3),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: TextField(
                            decoration: InputDecoration.collapsed(
                              hintText: 'Search...',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications, size: 30),
                Positioned(
                  top: 5,
                  right: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage('assets/images/story/cm1.jpeg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Nom Utilisateur',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Ionicons.home_outline,
                    color: const Color.fromARGB(255, 243, 222, 33)),
                title: Text('Accueil', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  print('Accueil clicked');
                },
              ),
              ListTile(
                leading: Icon(Ionicons.compass_outline, color: Colors.blue),
                title: Text('Explorer', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  print('Explorer clicked');
                },
              ),
              ListTile(
                leading: Icon(Ionicons.airplane_outline, color: Colors.blue),
                title: Text('Mes Voyages', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  print('Voyages clicked');
                },
              ),
              ListTile(
                leading: Icon(Ionicons.person_outline, color: Colors.blue),
                title: Text('Mon Profil', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  print('Profil clicked');
                },
              ),
              ListTile(
                leading: Icon(Ionicons.bookmark_outline, color: Colors.blue),
                title: Text('Favoris', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  print('Favoris clicked');
                },
              ),
              Divider(),
              ListTile(
                leading:
                    Icon(Ionicons.settings_outline, color: Colors.grey[700]),
                title: Text('Paramètres', style: TextStyle(fontSize: 16)),
                onTap: () {
                  Navigator.pop(context);
                  print('Paramètres clicked');
                },
              ),
              ListTile(
                leading: Icon(Ionicons.log_out_outline, color: Colors.red),
                title: Text('Déconnexion',
                    style: TextStyle(fontSize: 16, color: Colors.red)),
                onTap: () {
                  Navigator.pop(context);
                  print('Déconnexion clicked');
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Trending',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 3),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Icon(
                      Ionicons.chevron_down,
                      size: 15,
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: ExploreGrids(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Explore',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Ubuntu-Regular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
