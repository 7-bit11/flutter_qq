// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qq/QQ/search_message_list_page.dart';
import 'package:flutter_qq/QQ/user_option_page.dart';
import 'package:flutter_qq/QQ/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserContactsListPage extends StatefulWidget {
  const UserContactsListPage({super.key});

  @override
  State<UserContactsListPage> createState() => _UserContactsListPageState();
}

class _UserContactsListPageState extends State<UserContactsListPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double top = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: StudyAppBar.MyAppBar(
        "",
        context,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: top + 10, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const UserOptionPage(),
                        transition: Transition.leftToRight);
                  },
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/bit7.jpg",
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "联系人",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SvgPicture.asset(
                  "assets/svg/User-plus.svg",
                  color: Colors.black,
                  width: 25,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const SearchMessageListPage());
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Colors.grey),
                        SizedBox(width: 3),
                        Text("搜索",
                            style: TextStyle(fontSize: 16, color: Colors.grey))
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: SizedBox(
                          child: Text(
                            "新朋友",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/svg/chevronright.svg",
                          height: 30, color: Colors.grey),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: SizedBox(
                          child: Text(
                            "群通知",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SvgPicture.asset("assets/svg/chevronright.svg",
                          height: 30, color: Colors.grey),
                    ],
                  ),
                ),
                const Divider(
                  thickness: .2,
                ),
                const SizedBox(height: 10),
                TabBar(
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.blue,
                  indicatorColor: Colors.blue,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  automaticIndicatorColorAdjustment: false,
                  labelStyle: const TextStyle(fontSize: 15),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                  tabs: const [
                    Text("好友"),
                    Text("分组"),
                    Text("群聊"),
                    Text("设备"),
                    Text("通讯录"),
                    Text("订阅号")
                  ],
                  controller: tabController,
                ),
                const SizedBox(height: 20),
                // Container(
                //   color: Colors.amber,
                //   height: 100,
                // ),
                // Flexible(
                //     child: TabBarView(
                //   controller: tabController,
                //   children: [
                //     Container(color: Colors.red),
                //     Container(color: Colors.blue),
                //     Container(color: Colors.green),
                //     Container(color: Colors.yellow),
                //     Container(color: Colors.cyan),
                //     Container(color: Colors.teal)
                //   ],
                // ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
