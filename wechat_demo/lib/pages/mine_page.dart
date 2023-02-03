import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover_pages/discover_page_cell.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    final double leftMargin = MediaQuery.of(context).size.width - 35;

    return Container(
      color: Colors.lightBlue,
      child: Scaffold(
          body: Stack(
        //默认主轴方向是从里到外
        children: [
          //top
          Container(
              color: const Color.fromRGBO(220, 220, 220, 1),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView(
                  children: [
                    //头部
                    topViewWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    //cell
                    const DiscoverPageCell(
                      imageName: "images/icon_pay.png",
                      title: '支付',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //收藏，相册icon_album.png，卡包icon_card_bag.png，
                    // 表情icon_expression.png，设置icon_settings.png
                    const DiscoverPageCell(
                      imageName: "images/icon_collection.png",
                      title: '收藏',
                    ),
                    Container(
                      color: Colors.white,
                      height: 0.5,
                      margin: EdgeInsets.only(right: leftMargin),
                    ),
                    const DiscoverPageCell(
                      imageName: 'images/icon_card_bag.png',
                      title: '卡包',
                    ),
                    Container(
                      color: Colors.white,
                      height: 0.5,
                      margin: EdgeInsets.only(right: leftMargin),
                    ),
                    const DiscoverPageCell(
                      imageName: 'images/icon_expression.png',
                      title: '表情',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const DiscoverPageCell(
                      imageName: 'images/icon_settings.png',
                      title: '设置',
                    ),
                  ],
                ),
              )),
          //相机
          Container(
              margin: const EdgeInsets.only(top: 50, right: 10),
              color: const Color.fromRGBO(0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Image(
                    image: AssetImage("images/icon_camera.png"),
                    height: 35,
                  ),
                ],
              )),
        ],
      )),
    );
  }

  topViewWidget() {
    return Container(
        color: Colors.white,
        height: 200,
        child: Container(
          //内容视图
          // color: Colors.green,
          margin: const EdgeInsets.only(top: 100, left: 10, right: 10),
          child: Row(
            children: [
              //头像
              Container(
                height: 70,
                width: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('images/Avatar'
                      '.png')),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10,top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //名称
                      const SizedBox(
                        height: 35,
                        child: Text(
                          'Lucy',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //文字+箭头
                      SizedBox(
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('something',style: TextStyle(fontSize: 15),),
                            Image(image: AssetImage("images/icon_right.png"),
                              fit: BoxFit.cover,width: 15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
