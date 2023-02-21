import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/chat_pages/search_bar.dart';

import 'chat_model.dart';

class SearchPage extends StatefulWidget {

  final List sourceData;
  const SearchPage({Key? key,required this.sourceData,}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  //搜索关键字 - 由输入框输入
  String searchKey = '';
  //搜索结果数据
  List resData = [];

  //搜索输入中
  void onSearchInputting(String sKey) {

    searchKey = sKey;
    resData.clear();  //先清空上一次搜索结果

    if (sKey.isNotEmpty) {
      for (int i = 0; i < widget.sourceData.length; i++) {
        ChatModel chat = widget.sourceData[i];
        if (chat.name.contains(searchKey)) {
          resData.add(chat);
        }
      }
    }

    //刷新界面
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            //头部搜索框
            SearchBar(callBack: (sKey){
              onSearchInputting(sKey);
            }),
            //下方列表
            Expanded(
              child: MediaQuery.removeViewPadding(
                context: context,
                removeTop: true,  //去掉listView顶部默认padding
                child: ListView.builder(
                  itemCount: resData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: highlightShow(resData[index].name,index),  //高亮显示
                      subtitle: Container(
                        padding:const EdgeInsets.only(top: 8),
                        height: 30,
                        child: Text(resData[index].message,overflow:
                        TextOverflow.ellipsis,),
                      ),
                      leading: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          image: DecorationImage(image: NetworkImage
                            (resData[index].avatarUrl),),
                        ),
                      ) ,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //搜索关键字高亮显示
  RichText highlightShow(String orgStr,int index) {

    TextStyle normalStyle = const TextStyle(color: Colors.black);
    TextStyle highLightStyle = const TextStyle(color: Colors.yellow);

    //处理搜索key高亮显示的核心代码，分割再组合字符串
    List<TextSpan> tempSpan = [];
    List<String> subStrs = orgStr.split(searchKey);
    for (int i = 0; i < subStrs.length; i++) {
      tempSpan.add(TextSpan(text: subStrs[i],style: normalStyle));
      if (i == subStrs.length - 1) {continue;}
      tempSpan.add(TextSpan(text: searchKey,style: highLightStyle));
    }
    // print('要打印 RichText 了');
    // print(tempSpan);
    return RichText(text: TextSpan(text: '',children: tempSpan));
  }
}
