import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Simple Tab Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ModernTabBar(),
    );
  }
}

class SimpleTabBar extends StatefulWidget {
  const SimpleTabBar({super.key});

  @override
  State<SimpleTabBar> createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Simple Tab Bar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: const [
        Center(
          child: Text(
            'Welcome to Screen 1!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
        Center(
          child: Text(
            'Welcome to Screen 2!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ]),
    );
  }
}

class ModernTabBar extends StatefulWidget {
  const ModernTabBar({super.key});

  @override
  State<ModernTabBar> createState() => _ModernTabBarState();
}

class _ModernTabBarState extends State<ModernTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Modern Tab Bar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: TabBarView(
          controller: _tabController,
          children: const [
            Center(
              child: Text(
                'Welcome to Home!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            Center(
              child: Text(
                'Welcome to Settings!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
