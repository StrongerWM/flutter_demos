import 'package:flutter/material.dart';

import '../const.dart';

//索引条
class IndexBar extends StatefulWidget {
  final void Function(String str) indexBarCallBack;

  const IndexBar({Key? key, required this.indexBarCallBack}) : super(key: key);

  @override
  State<IndexBar> createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  var _lastIndexStr = '';

  //索引数据
  final List<Widget> _indexWords = [];

  //索引气泡指示器状态
  double _indicatorY = 0.0;
  bool _indicatorShow = false;//默认不显示
  String _indicatorText = 'A';
  
  @override
  Widget build(BuildContext context) {
    //避免多次渲染重复添加数据
    _indexWords.removeRange(0, _indexWords.length);
    _indexWords.addAll(prepareIndexWordsData());

    return Container(
      // color: Colors.red,
      width: 108,
      height: sHeightScreen(context) / 1.8,
      margin: EdgeInsets.only(
          left: sWidthScreen(context) - 108,
          top: sHeightScreen(context) / 8
      ),
      child: Row(
        children: [
          Container(
            width: 78,
            // color: Colors.blue,
            alignment: Alignment(0, _indicatorY),  //指示器范围测试为-1.1~1.11，跨度2.21
            child: _indicatorShow ? Stack(
              alignment: const Alignment(-0.2, 0),
              children: [
                const Image(
                  image: AssetImage('images/icon_bubble.png'),
                  width: 78,
                ),
                Text(
                  _indicatorText,
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                ),
              ],
            ) : null,
          ),
          GestureDetector(
            child: Container(
              color: const Color.fromRGBO(1, 1, 1, 0),
              width: 30,
              child: Column(
                children: _indexWords,
              ),
            ),
            //垂直滑动时
            onVerticalDragUpdate: (DragUpdateDetails details) {
              //这个方法只要在响应区内滑动就会一直调用
              // debugPrint('onVerticalDragUpdate');
              double offsetY = details.localPosition.dy;
              // details.localPosition.dy - sHeightScreen(context) / 8;
              //在索引不同时，回调返回索引值
              int index = getIndex(context, offsetY);
              // debugPrint('index = $index');
              String indexStr = indexWordsData[index];
              if (_lastIndexStr != indexStr) {
                widget.indexBarCallBack(indexStr);
                _lastIndexStr = indexStr;
                setState(() {
                  _indicatorShow = true;
                  _indicatorText = indexStr;
                  // 27 = indexWordsData.length - 1
                  _indicatorY = 2.21 / 27 * index - 1.1;
                });
              }
            },
            onVerticalDragDown: (DragDownDetails details) {
              double offsetY = details.localPosition.dy;
              int index = getIndex(context, offsetY);
              String indexStr = indexWordsData[index];
              widget.indexBarCallBack(indexStr);
              setState(() {
                _indicatorY = 2.21 / 27 * index - 1.1;
                _indicatorText = indexStr;
                _indicatorShow = true;
              });
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                _indicatorShow = false;
              });
            },
          ),
        ],
      ),
    );
  }
}

int getIndex(BuildContext context, double offsetY) {
  //找到渲染盒子
  // RenderBox box = context.findRenderObject() as RenderBox;
  //找到垂直偏移量
  // double y = globalPosition.dy;
  //每个索引项的高度
  double itemHeight = sHeightScreen(context) / 1.8 / indexWordsData.length;
  // debugPrint('itemHeight = $itemHeight');
  //计算出下标位置
  int index = (offsetY ~/ itemHeight).clamp(0, indexWordsData.length);
  //返回索引
  return index;
}

//准备索引字母数据-索引数据处理
List<Widget> prepareIndexWordsData() {
  List<Widget> res = [];
  for (int i = 0; i < indexWordsData.length; i++) {
    res.add(Expanded(
      child: Text(indexWordsData[i]),
    ));
  }
  return res;
}

//索引数据
const List indexWordsData = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
