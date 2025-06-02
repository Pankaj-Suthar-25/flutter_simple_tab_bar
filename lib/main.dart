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
      home: SimpleTabBar(),
    );
  }
}

class SimpleTabBar extends StatefulWidget {
  const SimpleTabBar({super.key});

  @override
  State<SimpleTabBar> createState() => _SimpleTabBarState();
}

class _SimpleTabBarState extends State<SimpleTabBar> with TickerProviderStateMixin {
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
        title: Text('Flutter Simple Tab Bar'),
        bottom:  TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
          ],
        ),
      ),
      body: TabBarView(
        children: [Center(
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
          ),]
      ),
    );
  }
}
