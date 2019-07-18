import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class _Item {
  String name, activeIcon, normalIcon;

  _Item(this.name, this.activeIcon, this.normalIcon);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var itemList;
  int _index = 0;
  var _pageList = [
    pages("1"),
    pages("2"),
    pages("3"),
    pages("4"),
    pages("5"),
  ];

  final itemNames = [
    _Item('首页', 'assets/images/ic_tab_home_active.png',
        'assets/images/ic_tab_home_normal.png'),
    _Item('书影音', 'assets/images/ic_tab_subject_active.png',
        'assets/images/ic_tab_subject_normal.png'),
    _Item('小组', 'assets/images/ic_tab_group_active.png',
        'assets/images/ic_tab_group_normal.png'),
    _Item('市集', 'assets/images/ic_tab_shiji_active.png',
        'assets/images/ic_tab_shiji_normal.png'),
    _Item('我的', 'assets/images/ic_tab_profile_active.png',
        'assets/images/ic_tab_profile_normal.png')
  ];

  ///获取底部bar的item
  List<BottomNavigationBarItem> getItems() {
    return itemNames
        .map((item) => BottomNavigationBarItem(
            icon: Image.asset(
              item.normalIcon,
              width: 30.0,
              height: 30.0,
            ),
            title: Text(
              item.name,
              style: TextStyle(fontSize: 10.0, color: Colors.black),
            ),
            activeIcon:
                Image.asset(item.activeIcon, width: 30.0, height: 30.0)))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    if (itemList == null) {
      itemList = getItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: _pageList[_index],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

Widget pages(String s) {
  return Container(
    child: Center(
      child: Text(s),
    ),
  );
}
