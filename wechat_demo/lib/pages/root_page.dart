
import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/contact_page.dart';
import 'package:wechat_demo/pages/discover_pages/discover_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';
import 'package:wechat_demo/pages/wechat_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 2;
  final List<Widget> _page = const [
    WeChatPage(),
    ContactPage(),
    DiscoverPage(),
    MinePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          fixedColor: Colors.red,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.ice_skating,
                  semanticLabel: 'icon',
                  size: 20,
                ),
                label: '微信'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.assessment,
                  semanticLabel: 'icon',
                  size: 22,
                ),
                label: '通讯录'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  semanticLabel: 'icon',
                  size: 24,
                ),
                label: '发现'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.abc,
                  semanticLabel: 'icon',
                ),
                label: '我的'),
          ],
        ),
            body: _page[_selectedIndex],
    );

  }
}
