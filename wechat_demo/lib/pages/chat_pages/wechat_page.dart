// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:wechat_demo/pages/chat_pages/chat_model.dart';
import 'package:wechat_demo/pages/const.dart';
import 'package:http/http.dart' as http;
//因为待会要用到的get或者post方法，同名方法很多，此处 as http 为了避免与其他方法冲突

class WeChatPage extends StatefulWidget {
  const WeChatPage({Key? key}) : super(key: key);

  @override
  State<WeChatPage> createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> with
    AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  //数据列表
  List _chatList = [];

  @override
  void initState() {
    super.initState();

    //发起网络请求
    // requestData();
    requestData()
        .then((value) {
          print('数据解析成功');
          setState(() {
            print('渲染');
            _chatList = value;
            // print(_chatList);
          });
          // debugPrint(value.toString());
        })
        .catchError((error) {
          print('请求失败，错误：$error');
        })
        .whenComplete(() => debugPrint('完毕'))
        .timeout(const Duration(milliseconds: 10))
        .catchError((onError) {
          print('超时 = $onError');
        });

    //模拟数据转换
    // simulateDataConvert();
  }

  //异步请求数据
  Future<List<ChatModel>> requestData() async {
    final url = Uri.parse(
        'http://rap2api.taobao.org/app/mock/309561/flutter/wx/chatlist');
    final res = await http.get(url);

    //请求成功，解析数据
    if (res.statusCode == 200) {
      final responseBody = res.body;
      // List<Map> chatList = json.decode(responseBody)['chatList'];这句会报错,泛型不要乱加
      List chatList = json.decode(responseBody)['chatList'];
      List<ChatModel> modelList =
          chatList.map((e) => ChatModel.fromMap(e)).toList();
      // throw Exception('stateCode = ${res.statusCode}');
      return modelList;
    }
    throw Exception('stateCode = ${res.statusCode}');
  }

  //异步渲染FutureBuilder - 此处仅做尝试，异步渲染比较适合数据量比较小，界面数据不变动的请求
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         backgroundColor: cColorTheme,
  //         title: const Text('微信', style: TextStyle(color: Colors.black)),
  //         actions: [
  //           PopupMenuButton(
  //             offset: const Offset(-22, 45),
  //             color: const Color.fromRGBO(1, 1, 1, 0.65),
  //             icon: const Image(
  //               image: AssetImage('images/icon_add.png'),
  //               width: 25,
  //             ),
  //             itemBuilder: (BuildContext context) {
  //               return [
  //                 popItem('images/icon_chat_white.png', '发起群聊'),
  //                 popItem('images/icon_add_friends.png', '添加朋友'),
  //                 popItem('images/icon_scanning_white.png', '扫一扫'),
  //                 popItem('images/icon_payment.png', '收付款'),
  //               ];
  //             },
  //           ),
  //           //typedef PopupMenuItemBuilder<T> = List<PopupMenuEntry<T>> Function(BuildContext context);
  //         ],
  //       ),
  //       //异步渲染 📢📢📢
  //       body: FutureBuilder(
  //         future: requestData(),
  //         builder: (BuildContext context, AsyncSnapshot snapshot){
  //           //print(snapshot); 打印结果 AsyncSnapshot<List<ChatModel>> ..
  //           //当请求完成时，渲染界面
  //           if (snapshot.connectionState == ConnectionState.done) {
  //             return const Center(child: Text('done'),);
  //           } else {
  //             return const Center(child: Text('Loading ...'),);
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
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
              //typedef PopupMenuItemBuilder<T> = List<PopupMenuEntry<T>> Function(BuildContext context);
              itemBuilder: (BuildContext context) {
                return [
                  popItem('images/icon_chat_white.png', '发起群聊'),
                  popItem('images/icon_add_friends.png', '添加朋友'),
                  popItem('images/icon_scanning_white.png', '扫一扫'),
                  popItem('images/icon_payment.png', '收付款'),
                ];
              },
            ),
          ],
        ),
        body: Container(
            child: _chatList.isEmpty
                ? const Center(
                    child: Text('loading..'),
                  )
                : ListView.builder(
                    itemCount: _chatList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(
                          _chatList[index].name,
                        ),
                        subtitle: Container(
                          padding: const EdgeInsets.only(top: 5, right: 5),
                          height: 25,
                          child: Text(
                            _chatList[index].message,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        leading: Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            image: DecorationImage(
                                image:
                                    NetworkImage(_chatList[index].avatarUrl)),
                          ),
                        ),
                      );
                    },
                  )
            //typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);
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
          const SizedBox(
            width: 10,
          ),
          Text(
            itemTitle,
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }

  //数据转换模拟
  void simulateDataConvert() {
    Map testMap = {
      'name': 'aWood',
      'imageUrl': 'url',
      'message': 'See you tomorrow',
    };

    //拿到了json数据
    String testJson = jsonEncode(testMap);
    //json转map
    Map resMap = jsonDecode(testJson);
    ChatModel chatModel = ChatModel.fromMap(resMap);
    debugPrint(chatModel.name); // -flutter: aWood
  }
}
