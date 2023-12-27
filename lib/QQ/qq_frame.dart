// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_qq/QQ/bodys/user_contacts_list_page.dart';
import 'package:flutter_qq/QQ/bodys/user_message_list_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QQFrame extends StatefulWidget {
  const QQFrame({super.key});

  @override
  State<QQFrame> createState() => _QQFrameState();
}

class _QQFrameState extends State<QQFrame> with AutomaticKeepAliveClientMixin {
  int index = 0;
  List<Widget> pages = const [
    UserMessageListPage(),
    UserContactsListPage(),
    // UserMessageListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.white,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/Chat.svg",
                  color: index == 0 ? Colors.blue : Colors.black,
                ),
                label: "消息"),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/svg/User_01.svg",
                  color: index == 1 ? Colors.blue : Colors.black,
                ),
                label: "联系人"),
            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset(
            //       "assets/svg/ Heart_01.svg",
            //       color: index == 2 ? Colors.blue : Colors.black,
            //     ),
            //     label: "动态")
          ]),
      body: IndexedStack(
        index: index,
        children: pages,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
