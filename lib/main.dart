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
      home: const InteractiveTabBar(),
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

class InteractiveTabBar extends StatefulWidget {
  const InteractiveTabBar({super.key});

  @override
  State<InteractiveTabBar> createState() => _InteractiveTabBarState();
}

class _InteractiveTabBarState extends State<InteractiveTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _screen1Text = 'Welcome to Screen 1';
  String _screen2Text = 'Welcome to Screen 2';
  double _scale = 1.0;

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

  void _changeText(int tabIndex) {
    setState(() {
      if (tabIndex == 0) {
        _screen1Text = 'You tapped on Screen 1!';
      } else {
        _screen2Text = 'You tapped on Screen 2!';
      }
    });
  }

  void _animateText() {
    setState(() {
      _scale = 1.2;
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Interactive Tab Bar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GestureDetector(
            onTap: () {
              _changeText(0);
              _animateText();
            },
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: _scale)
                      .animate(CurvedAnimation(
                    parent: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 300),
                    ),
                    curve: Curves.easeInOut,
                  )),
                  child: Text(
                    _screen1Text,
                    key: ValueKey<String>(_screen1Text),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              _changeText(1);
              _animateText();
            },
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: _scale)
                      .animate(CurvedAnimation(
                    parent: AnimationController(
                      vsync: this,
                      duration: const Duration(milliseconds: 300),
                    ),
                    curve: Curves.easeInOut,
                  )),
                  child: Text(
                    _screen2Text,
                    key: ValueKey<String>(_screen2Text),
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
