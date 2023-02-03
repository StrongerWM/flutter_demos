import 'package:flutter/material.dart';
import 'package:wechat_demo/pages/discover_pages/discover_child_page.dart';

class DiscoverPageCell extends StatefulWidget {
  final String imageName;
  final String title;
  final String? subTitle;
  final String? subImageName;

  const DiscoverPageCell(
      {Key? key,
      required this.imageName,
      required this.title,
      this.subTitle,
      this.subImageName})
      : super(key: key);

  @override
  State<DiscoverPageCell> createState() => _DiscoverPageCellState();
}

class _DiscoverPageCellState extends State<DiscoverPageCell> {
  Color _currentColor = Colors.white;
  final Color _selectColor = const Color.fromRGBO(220, 220, 220, 1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('onTap');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => DiscoverChildPage(
                  title: widget.title,
                )));
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: builder(MaterialPageRoute(builder: builder)))
        //
        // )
        // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
        //   return DiscoverChildPage(title: widget.title,);
        // }));
      },
      onTapDown: (TapDownDetails details) {
        debugPrint('onTapDown');
        setState(() {
          _currentColor = _selectColor;
        });
      },
      onTapUp: (TapUpDetails details) {
        debugPrint('onTapUp');
        setState(() {
          _currentColor = Colors.white;
        });
      },
      onTapCancel: () {
        debugPrint('onTapCancel');
        setState(() {
          _currentColor = Colors.white;
        });
      },
      child: Container(
        color: _currentColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(widget.imageName!),
                    width: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(widget.title!),
                ],
              ),
            ),
            //right
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    widget.subTitle ?? "",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  widget.subTitle != null
                      ? const Image(
                          image: AssetImage("images/icon_badge.png"),
                          width: 10,
                        )
                      : const SizedBox(
                          width: 1,
                        ),
                  const Image(
                    image: AssetImage("images/icon_right.png"),
                    width: 15,
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
