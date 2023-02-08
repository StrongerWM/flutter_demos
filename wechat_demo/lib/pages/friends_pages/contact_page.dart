import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/const.dart';

import 'contact_model.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  //准备头部数据
  final List _topItemData = <ContactModel>[
    ContactModel(name: '新的朋友',imageAssets: 'images/icon_new_friends.png'),
    ContactModel(name: '群聊',imageAssets: 'images/icon_group.png'),
    ContactModel(name: '标签',imageAssets: 'images/icon_label.png'),
    ContactModel(name: '公众号',imageAssets: 'images/icon_accounts.png'),
  ];

  //列表数据
  final List _contactListData = data;

  //渲染item
  Widget _itemBuild(BuildContext context, int index) {
    return index < _topItemData.length
        ? ContactCell(model: _topItemData[index],)
        : ContactCell(model: _contactListData[index - 4]);
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
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: )
                // ),
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
                itemBuilder: _itemBuild,
                itemCount: _topItemData.length + _contactListData.length,
              ),
            ),
            //索引
            Container(
              color: Colors.green,
              margin: EdgeInsets.only(left: sWidthScreen(context)-10),
            ),
          ],
        ),
      ),
    );
  }
}


class ContactCell extends StatelessWidget {
  final ContactModel model;

  const ContactCell({Key? key, required this.model,}) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                child: Text(model.name!,style: const TextStyle(fontSize: 18),),
              ),
              Container(
                color: Colors.grey,
                height: 0.5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
