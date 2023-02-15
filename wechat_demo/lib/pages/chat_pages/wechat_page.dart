import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/const.dart';

class WeChatPage extends StatefulWidget {
  const WeChatPage({Key? key}) : super(key: key);

  @override
  State<WeChatPage> createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: cColorTheme,
          title: const Text('微信', style: TextStyle(color: Colors.black)),
          actions: [
            PopupMenuButton(
              offset: const Offset(-22, 45),
              color: const Color.fromRGBO(1, 1, 1, 0.65),
              icon: const Image(
                image: AssetImage('images/icon_add.png'),
                width: 25,
              ),
              itemBuilder: (BuildContext context) {
                return [
                  popItem('images/icon_chat_white.png', '发起群聊'),
                  popItem('images/icon_add_friends.png', '添加朋友'),
                  popItem('images/icon_scanning_white.png', '扫一扫'),
                  popItem('images/icon_payment.png', '收付款'),
                ];
              },
            ),
            //typedef PopupMenuItemBuilder<T> = List<PopupMenuEntry<T>> Function(BuildContext context);
          ],
        ),
        body: const Center(
          child: Text('wechat'),
        ),
      ),
    );
  }

  //构建popItem - 代码优化，直接把实现写到上面的builder里了
  List<PopupMenuEntry> _popItemBuilder(BuildContext context) {
    return [
      popItem('images/icon_chat_white.png', '发起群聊'),
      popItem('images/icon_add_friends.png', '添加朋友'),
      popItem('images/icon_scanning_white.png', '扫一扫'),
      popItem('images/icon_payment.png', '收付款'),
    ];
  }

  //单个PopupMenuItem的创建
  PopupMenuItem popItem(String itemImageName, String itemTitle) {
    return PopupMenuItem(
      child: Row(
        children: [
          Image(
            image: AssetImage(itemImageName),
            width: 20,
          ),
          const SizedBox(width: 10,),
          Text(
            itemTitle,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
