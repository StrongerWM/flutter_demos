import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat_pages/search_page.dart';
import 'package:wechat_demo/pages/const.dart';

//仅仅用来展示，并不能直接输入

class SearchCell extends StatelessWidget {
  const SearchCell({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      width: sWidthScreen(context),
      color: cColorTheme,
      child: GestureDetector(
        child: Stack(
          children: [
            //底部白色圆角搜索框背景
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.white,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('images/icon_magnifier_black'
                        '.png'),
                    color: Colors.grey,
                    width: 15,
                  ),
                  Text(
                    '  搜索',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}