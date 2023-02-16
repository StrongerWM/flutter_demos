import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/friends_pages/contact_page.dart';
import 'package:wechat_demo/pages/discover_pages/discover_page.dart';
import 'package:wechat_demo/pages/mine_page.dart';
import 'package:wechat_demo/pages/chat_pages/wechat_page.dart';

//PVCRootPage - PageViewController版本的rootPage

class PVCRootPage extends StatefulWidget {
  const PVCRootPage({Key? key}) : super(key: key);

  @override
  State<PVCRootPage> createState() => _PVCRootPageState();
}

class _PVCRootPageState extends State<PVCRootPage> {

  int _selectedIndex = 0;
  //使用pageViewController作为底部标签栏
  final PageController _pageController = PageController(
    initialPage: 0
  );

  final List<Widget> _pages = const [
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
          _pageController.jumpToPage(index);
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
      body: PageView (
        controller: _pageController,
        //默认是可以左右滑动切换页面的
        //禁用左右滑动
        physics: const NeverScrollableScrollPhysics(),
        //当左右滑动时，更新底部的tab按钮样式
        onPageChanged:(int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
    );
  }
}
