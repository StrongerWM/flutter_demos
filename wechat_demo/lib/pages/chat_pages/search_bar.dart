import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/const.dart';

class SearchBar extends StatefulWidget {
  final void Function(String sKey) callBack;

  const SearchBar({Key? key, required this.callBack}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String searchKey = '';
  bool showClearIcon = false; //是否显示清空搜索框按钮
  final TextEditingController _editingController = TextEditingController();

  //返回搜索的关键字
  void onSearchKeyChange(String sKey) {
    if (sKey.isEmpty){
      showClearIcon = false;
    } else {
      showClearIcon = true;
    }
    setState(() {
    });
    // print('search bar content = $sKey');
    widget.callBack(sKey);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      color: cColorTheme,
      child: Column(
        children: [
          //上部留白
          const SizedBox(height: 44),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                height: 45,
                width: sWidthScreen(context) - 60,
                //搜索条
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    const Image(
                      image: AssetImage('images/icon_magnifier_black'
                          '.png'),
                      color: Colors.grey,
                      width: 22,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _editingController,
                        onChanged: (value) {
                          onSearchKeyChange(value);
                        },
                        autofocus: true,
                        cursorColor: Colors.blue,
                        decoration: const InputDecoration(
                          hintText: 'Find',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5, right: 8),
                        ),
                      ),
                    ),
                    showClearIcon
                        ? GestureDetector(
                            child: const Icon(
                              Icons.cancel,
                              size: 24,
                              color: Colors.grey,
                            ),
                            onTap: () {
                              //清空搜索框
                              _editingController.clear();
                              onSearchKeyChange('');
                            },
                          )
                        : const SizedBox(
                            width: 1,
                          ),
                    const SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
              //取消按钮
              SizedBox(
                width: 44,
                child: GestureDetector(
                  child: const Text(
                    '取消 ',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
