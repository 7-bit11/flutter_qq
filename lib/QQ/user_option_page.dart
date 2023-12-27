// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qq/QQ/user_information_page.dart';
import 'package:flutter_qq/QQ/widget/appbar.dart';
import 'package:flutter_qq/QQ/widget/bitmeun.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class UserOptionPage extends StatefulWidget {
  const UserOptionPage({super.key});

  @override
  State<UserOptionPage> createState() => _UserOptionPageState();
}

class _UserOptionPageState extends State<UserOptionPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //extendBodyBehindAppBar: true,
      appBar: StudyAppBar.MyAppBar("", context,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          leadingWidth: 100,
          leading: MyMeun(
              context: context,
              child: TextButton.icon(
                onPressed: () {},
                style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                icon: SvgPicture.asset(
                  "assets/svg/Checkbox_Check.svg",
                  color: Colors.black,
                ),
                label: const Text("打卡",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
              items: [
                BitMeunItem(
                  icon: SvgPicture.asset("assets/svg/Group 151.svg"),
                  onTap: () {},
                  text: '创建DAO',
                ),
                BitMeunItem(
                  icon: SvgPicture.asset("assets/svg/QQ.svg"),
                  onTap: () {},
                  text: '创建群聊',
                ),
                BitMeunItem(
                  icon: SvgPicture.asset("assets/svg/User-plus.svg"),
                  onTap: () {},
                  text: '添加好友',
                ),
                BitMeunItem(
                  icon: SvgPicture.asset("assets/svg/Expand.svg"),
                  onTap: () {},
                  text: '扫一扫',
                ),
              ]),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.clear_rounded,
                color: Colors.black,
                size: 25,
              ),
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(const UserInformationPage(),
                              transition: Transition.downToUp);
                        },
                        child: Hero(
                          tag: "assets/images/bit7.jpg",
                          child: ClipOval(
                            child: Image.asset(
                              "assets/images/bit7.jpg",
                              alignment: Alignment.topCenter,
                              fit: BoxFit.cover,
                              width: 60,
                              height: 60,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.black,
                              highlightColor: Colors.red,
                              child: const Text(
                                "7_bit",
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            const Text(
                              "👑🌙✨✨",
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "sex robot",
                                  style: TextStyle(fontSize: 15),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 5),
                                SvgPicture.asset(
                                  "assets/svg/edit.svg",
                                  height: 15,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.qr_code)
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
                child: ListView(
              children: [
                getItem("folder", "文件"),
                const SizedBox(height: 15),
                getItem("upload 1", "微云"),
                const SizedBox(height: 15),
                getItem("picture", "相册"),
                const SizedBox(height: 15),
                getItem("bookmark", "收藏"),
                const SizedBox(height: 15),
                getItem("tethering 1", "王卡"),
                const SizedBox(height: 15),
                getItem("desktop 1", "我的电脑"),
                const SizedBox(height: 15),
                getItem("controller 1", "游戏中心"),
              ],
            )),
            Row(
              children: [
                MyMeun(
                    child: getItem1("setting", "设置"),
                    context: context,
                    isup: false,
                    items: [
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/Group 151.svg"),
                        onTap: () {},
                        text: '创建DAO',
                      ),
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/QQ.svg"),
                        onTap: () {},
                        text: '创建群聊',
                      ),
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/User-plus.svg"),
                        onTap: () {},
                        text: '添加好友',
                      ),
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/Expand.svg"),
                        onTap: () {},
                        text: '扫一扫',
                      ),
                    ]),
                const SizedBox(width: 20),
                getItem1("mobile", "等级"),
                const SizedBox(width: 20),
                MyMeun(
                    child: getItem1("dark mode", "夜间"),
                    context: context,
                    isup: false,
                    items: [
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/Group 151.svg"),
                        onTap: () {},
                        text: '创建DAO',
                      ),
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/QQ.svg"),
                        onTap: () {},
                        text: '创建群聊',
                      ),
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/User-plus.svg"),
                        onTap: () {},
                        text: '添加好友',
                      ),
                      BitMeunItem(
                        icon: SvgPicture.asset("assets/svg/Expand.svg"),
                        onTap: () {},
                        text: '扫一扫',
                      ),
                    ]),
                const SizedBox(width: 20),
                getItem1("On", "天气"),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget getItem(String svg, String str) {
  return Row(
    children: [
      SvgPicture.asset("assets/svg/$svg.svg"),
      const SizedBox(width: 15),
      Expanded(
        child: Text(
          str,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      SvgPicture.asset(
        "assets/svg/chevronright.svg",
        height: 35,
        color: Colors.grey,
      ),
    ],
  );
}

Widget getItem1(String svg, String str) {
  return Column(
    children: [
      SvgPicture.asset(
        "assets/svg/$svg.svg",
        width: 25,
      ),
      const SizedBox(height: 5),
      Text(
        str,
        style: const TextStyle(fontSize: 14),
      ),
    ],
  );
}

Widget a(BuildContext context) {
  return Listener(
    onPointerUp: (event) {
      BitMeunshowDialog(
        context: context,
        event: event,
        items: [
          BitMeunItem(
            icon: SvgPicture.asset("assets/svg/Group 151.svg"),
            onTap: () {},
            text: '创建DAO',
          ),
          BitMeunItem(
            icon: SvgPicture.asset("assets/svg/QQ.svg"),
            onTap: () {},
            text: '创建群聊',
          ),
          BitMeunItem(
            icon: SvgPicture.asset("assets/svg/User-plus.svg"),
            onTap: () {},
            text: '添加好友',
          ),
          BitMeunItem(
            icon: SvgPicture.asset("assets/svg/Expand.svg"),
            onTap: () {},
            text: '扫一扫',
          ),
        ],
      );
    },
    child: AbsorbPointer(
      child: TextButton.icon(
        onPressed: () {
          showDialog(
              builder: (BuildContext context) {
                return const DetailPage("assets/images/dao.jpg");
              },
              context: context);
        },
        style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
            overlayColor: MaterialStatePropertyAll(Colors.transparent)),
        icon: SvgPicture.asset(
          "assets/svg/Checkbox_Check.svg",
          color: Colors.black,
        ),
        label: const Text("打卡",
            style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
    ),
  );
}
