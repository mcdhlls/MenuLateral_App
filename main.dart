import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    HomePage(),
    EducationPage(),
    BusinessPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
    Navigator.of(context)
        .pop(); // Cierra el Drawer después de cambiar la página
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Menu'),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: Builder(
          builder: (context) => Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purpleAccent],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/oasis.jpeg'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Menu',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () => _onItemTapped(0),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text('Education'),
                  onTap: () => _onItemTapped(1),
                ),
                ListTile(
                  leading: Icon(Icons.business),
                  title: Text('Business'),
                  onTap: () => _onItemTapped(2),
                ),
              ],
            ),
          ),
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: _pages[_currentPage],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Bienvenido a la página de Home.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Education'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Bienvenido a la página de Education.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Text(
          'Bienvenido a la página de Business.',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
