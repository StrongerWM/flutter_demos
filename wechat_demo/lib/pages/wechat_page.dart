import 'package:flutter/material.dart';

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
        appBar: AppBar(title: const Text('微信'),backgroundColor: Colors.blue,),
        body: const Center(
          child: Text('wechat'),
        ),
      ),
    );
  }
}
