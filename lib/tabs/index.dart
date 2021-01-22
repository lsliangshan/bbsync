import 'package:flutter/material.dart';
import 'package:bbsync/tabs/home.dart';
import 'package:bbsync/tabs/msg.dart';
import 'package:bbsync/tabs/profile.dart';
import 'package:fluro/fluro.dart';
import 'package:bbsync/widget/Routes.dart';
// class Index extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('手机相册同步助手'),
//       ),
//       body: new Container(
//         margin: EdgeInsets.all(10),
//         child: new Text('主页'),
//       ),
//       bottomNavigationBar: BottomNavigationBar(items: [],),
//     );
//   }
// }

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      backgroundColor: Colors.pink,
      title: Text('主页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      backgroundColor: Colors.pink,
      title: Text('消息'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      backgroundColor: Colors.pink,
      title: Text('我的'),
    ),
  ];

  int currentIndex;

  final pages = [
    TabHome(),
    TabMsg(),
    TabProfile(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  final router = FluroRouter();

  @override
  Widget build(BuildContext context) {
    router.define('/detail', handler: detailHandler);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('底部导航栏'),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavItems,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changeTab(index);
        },
      ),
      body: pages[currentIndex],
    );
  }

  void _changeTab(index) {
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
