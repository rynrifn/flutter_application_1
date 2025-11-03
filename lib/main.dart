import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 🔔 Global messenger untuk menampilkan SnackBar (pesan notifikasi)
  static final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showMsg(String message) => _messengerKey.currentState
      ?.showSnackBar(SnackBar(content: Text(message)));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: _messengerKey,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(
              seedColor: Colors.green,
              brightness: Brightness.light,
            ).copyWith(
              primary: Colors.green[700],
              secondary: Colors.grey[800],
              surface: Colors.grey[100],
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 🧩 Halaman utama & halaman profil
    List<Widget> _pages = <Widget>[
      // HOME PAGE
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Rifki Febrian',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // 🎯 Contoh-komponen Flutter
            Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Container',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Column(
              children: List.generate(
                3,
                (i) => Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text('Column item ${i + 1}'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.orange),
                SizedBox(width: 8),
                Text('Row Example'),
              ],
            ),
            const SizedBox(height: 20),

            // 🔘 Tombol-tombol
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.pink),
              onPressed: () => MyApp.showMsg('IconButton pressed'),
            ),
            const SizedBox(height: 10),

            TextButton(
              onPressed: () => MyApp.showMsg('TextButton pressed'),
              child: const Text('TextButton'),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => MyApp.showMsg('ElevatedButton pressed'),
              child: const Text('ElevatedButton'),
            ),
            const SizedBox(height: 10),

            FilledButton(
              onPressed: () => MyApp.showMsg('FilledButton pressed'),
              child: const Text('FilledButton'),
            ),
            const SizedBox(height: 10),

            OutlinedButton(
              onPressed: () => MyApp.showMsg('OutlinedButton pressed'),
              child: const Text('OutlinedButton'),
            ),
            const SizedBox(height: 10),

            FloatingActionButton(
              onPressed: () => MyApp.showMsg('FloatingActionButton pressed'),
              child: const Icon(Icons.add),
            ),
            const SizedBox(height: 10),

            SegmentedButton<int>(
              segments: const [
                ButtonSegment(value: 1, label: Text('A')),
                ButtonSegment(value: 2, label: Text('B')),
                ButtonSegment(value: 3, label: Text('C')),
              ],
              selected: const {1},
              onSelectionChanged: (_) =>
                  MyApp.showMsg('SegmentedButton pressed'),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),

      // PROFILE PAGE
      const Center(
        child: Text(
          'Profile Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(leading: Icon(Icons.home), title: Text('Home')),
            ListTile(leading: Icon(Icons.person), title: Text('Profile')),
          ],
        ),
      ),
      body: Center(child: _pages[_selectedIndex]),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
