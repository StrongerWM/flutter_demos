import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover_page_cell.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  // final Color _themeColor = const Color(0xFFE0E0E0);
  // final Color _themeColor = Colors.blue;

  // debugPrint(_leftMargin);

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Color.fromRGBO(224, 224, 224, 1.0);
    // final double _leftMargin = (window.physicalSize.width - 50);
    final double leftMargin = MediaQuery.of(context).size.width - 35;

    return Container(
      child: Scaffold(
        appBar: AppBar(title: const Text("发现", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),), backgroundColor: themeColor,),
        body: Container(
          // color: const Color.fromRGBO(224, 224, 224, 1.0),
          color: themeColor,
          height: 800,
          child: ListView(
              children:  [
                //朋友圈
                const DiscoverPageCell(
                  imageName: "images/icon_friend_circle.png",
                  title: "朋友圈",
                  subImageName: "images/icon_badge.png",
                ),

                //视频号，直播
                const SizedBox(height: 10,),
                const DiscoverPageCell(
                  imageName: "images/icon_friend_circle.png",
                  title: "视频号",
                ),
                Container(color: Colors.white,height: 1,width: 0,margin: EdgeInsets.only(right: leftMargin)),
                const DiscoverPageCell(
                  imageName: "images/icon_friend_circle.png",
                  title: "直播",
                  subImageName: "images/icon_badge.png",
                ),

                //扫一扫，摇一摇
                const SizedBox(height: 10,),
                const DiscoverPageCell(
                  imageName: "images/icon_scanning_blue.png",
                  title: "扫一扫",
                  subImageName: "images/icon_badge.png",
                ),
                Container(color: Colors.white,height: 1,width: 0,margin: EdgeInsets.only(right: leftMargin)),
                const DiscoverPageCell(
                  imageName: "images/icon_shake.png",
                  title: "摇一摇",
                  subImageName: "images/icon_badge.png",
                  subTitle: "618~京东618~京东618~京东618~",
                ),

                //看一看，搜一搜
                const SizedBox(height: 10,),
                const DiscoverPageCell(
                  imageName: "images/icon_look.png",
                  title: "看一看",
                  subImageName: "images/icon_badge.png",
                  subTitle: "京东618",
                ),
                Container(color: Colors.white,height: 1,width: 0,margin: EdgeInsets.only(right: leftMargin)),
                const DiscoverPageCell(
                  imageName: "images/icon_search.png",
                  title: "搜一搜",
                  subImageName: "images/icon_badge.png",
                  subTitle: "京东618",
                ),

                //附近，
                const SizedBox(height: 10,),
                const DiscoverPageCell(
                  imageName: "images/icon_people_nearby.png",
                  title: "附近",
                  subImageName: "images/icon_badge.png",
                  subTitle: "京东618",
                ),

                //购物，游戏
                const SizedBox(height: 10,),
                const DiscoverPageCell(
                  imageName: "images/icon_shopping.png",
                  title: "购物",
                  subImageName: "images/icon_badge.png",
                  subTitle: "京东618",
                ),
                Container(color: Colors.white,height: 1,width: 0,margin: EdgeInsets.only(right: leftMargin)),
                const DiscoverPageCell(
                  imageName: "images/icon_game.png",
                  title: "游戏",
                  subImageName: "images/icon_badge.png",
                  subTitle: "京东618",
                ),

                //小程序
                const SizedBox(height: 10,),
                const DiscoverPageCell(
                  imageName: "images/icon_applets.png",
                  title: "小程序",
                  subImageName: "images/icon_badge.png",
                  subTitle: "京东618",
                ),

              ],
          ),
        )
      ),
    );
  }
}
