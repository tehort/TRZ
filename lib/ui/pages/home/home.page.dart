import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/ui/pages/contacts/contacts.page.dart';
import 'package:trz/ui/pages/explore/explore.page.dart';
import 'package:trz/ui/pages/home/home.viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin<HomePage> {
  var vm = inject<HomeViewModel>();
  TabController tabController;
  int _currentIndex = 0;

  static final List<Widget> tabs = <Widget>[
    ExplorePage(),
    ContactsPage(),
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      vsync: this,
      length: tabs.length,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Observer(
          builder: (_) {
            return Scaffold(
              body: Stack(
                children: <Widget>[
                  TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: tabs,
                  ),
                ],
              ),
              bottomNavigationBar: bottomNavigationBar(
                vm.activeTabIndex,
                context,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget bottomNavigationBar(int activeTabIndex, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (currentIndex) {
          setState(() {
            _currentIndex = currentIndex;
          });

          tabController.animateTo(_currentIndex);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: 'Contacts',
          )
        ],
      ),
    );
  }
}
