import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/const.dart';
import 'package:wechat_demo/pages/discover_pages/discover_child_page.dart';

import 'contact_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  //准备头部数据
  final List _topItemData = <ContactModel>[
    ContactModel(name: '新的朋友', imageAssets: 'images/icon_new_friends.png'),
    ContactModel(name: '群聊', imageAssets: 'images/icon_group.png'),
    ContactModel(name: '标签', imageAssets: 'images/icon_label.png'),
    ContactModel(name: '公众号', imageAssets: 'images/icon_accounts.png'),
  ];

  //列表数据
  final List<ContactModel> _contactListData = [];

  //只在重新创建页面的时候才会执行一次这个方法，hotReload不执行
  @override
  void initState() {
    super.initState();
    _contactListData..addAll(simulateNetData)..addAll(simulateNetData);

    //对列表数据进行排序
    _contactListData.sort((ContactModel A, ContactModel B)
    {
      return A.indexLetter!.compareTo(B.indexLetter!);
    });

    prepareIndexWordsData();
  }

  //索引数据
  final List <Widget>words = [];
  void prepareIndexWordsData(){
    for (int i = 0; i < indexWordsData.length; i++){
      words.add(Expanded(
        child: Text(indexWordsData[i]),
      ));
    }
  }

  //渲染item
  Widget _itemForRow(BuildContext context, int index) {
    if (index < _topItemData.length) {
      //隐藏掉头部最后一个item的分割线
      return (index == _topItemData.length-1)
          ? ContactCell(model: _topItemData[index], isShowGroupTitle: false,
          isShowSeparateLine: false,)
          : ContactCell(model: _topItemData[index], isShowGroupTitle: false,
        isShowSeparateLine: true,);
    }
    //联系人列表数据下标起始位置
    int contactIndex = index - 4;

    bool showGroupTitle = true;
    //对头部以下的列表项，进行groupTitle的设置
    if (contactIndex > 0 && index < _contactListData.length + 4){
      showGroupTitle = (_contactListData[contactIndex-1].indexLetter ==
          _contactListData[contactIndex].indexLetter)
          ? false
          : true;
    }

    //隐藏每组最后一个item的分割线
    bool showLine = false;
    if (contactIndex < _contactListData.length - 1){
      showLine = (_contactListData[contactIndex].indexLetter ==
          _contactListData[contactIndex + 1].indexLetter)
          ? true
          : false;
    }

    return ContactCell(
        model: _contactListData[contactIndex], isShowGroupTitle:
    showGroupTitle, isShowSeparateLine: showLine,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "联系人",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: cColorTheme,
        actions: [
          Container(
            // color: Colors.blue,
            margin: const EdgeInsets.only(right: 15),
            width: 25,
            // height: 20,
            child: GestureDetector(
              child: const Image(
                image: AssetImage('images/icon_friends_add.png'),
              ),
              onTap: () {
                debugPrint('boring');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const DiscoverChildPage(title: '添加朋友');
                }));
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.green,
        child: Stack(
          children: [
            //列表
            Container(
              color: Colors.white,
              child: ListView.builder(
                itemBuilder: _itemForRow,
                itemCount: _topItemData.length + _contactListData.length,
              ),
            ),
            //索引
            Container(
              color: const Color.fromRGBO(1, 1, 1, 0.2),
              width: 30,
              height: sHeightScreen(context) / 1.8,
              margin: EdgeInsets.only(left: sWidthScreen(context) - 30,top:
              sHeightScreen(context)/8),
              child: Column(
                children: words,
              ),
            ),
          ],
        ),
      ),
    );
  }


}

class ContactCell extends StatelessWidget {
  final ContactModel model;
  final bool? isShowGroupTitle;  //组标题是否显示
  final bool? isShowSeparateLine;  //分割线是否显示

  const ContactCell({
    Key? key,
    required this.model,
    this.isShowGroupTitle,
    this.isShowSeparateLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //组头
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10),
          color: cColorTheme,
          height: isShowGroupTitle! ? 30 : 0,
          child: model.indexLetter != null
              ? Text(model.indexLetter!)
              : null,
        ),
        //内容
        Container(
          child: Row(
            children: [
              //头像
              Container(
                margin: const EdgeInsets.all(10),
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: model.imageUrl != null
                      ? DecorationImage(image: NetworkImage(model.imageUrl!))
                      : DecorationImage(image: AssetImage(model.imageAssets!)),
                ),
              ),
              // const SizedBox(width: 10),
              //名字
              Container(
                width: sWidthScreen(context) - 64,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 64,
                      child: Text(
                        model.name!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: isShowSeparateLine! ? 0.5 : 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

