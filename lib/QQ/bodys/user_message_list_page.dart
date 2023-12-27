// ignore_for_file: deprecated_member_use

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qq/QQ/message_details_page.dart';
import 'package:flutter_qq/QQ/model/msg_model.dart';
import 'package:flutter_qq/QQ/search_message_list_page.dart';
import 'package:flutter_qq/QQ/user_device_page.dart';
import 'package:flutter_qq/QQ/user_option_page.dart';
import 'package:flutter_qq/QQ/widget/appbar.dart';
import 'package:flutter_qq/QQ/widget/bitmeun.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class UserMessageListPage extends StatefulWidget {
  const UserMessageListPage({super.key});

  @override
  State<UserMessageListPage> createState() => _UserMessageListPageState();
}

class _UserMessageListPageState extends State<UserMessageListPage>
    with AutomaticKeepAliveClientMixin {
  late List<MsgModel> data = [];
  late bool loading = false;
  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() async {
    Future.delayed(const Duration(seconds: 2), () {
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/jx/wallhaven-jxl31y.png',
          msg: '所以，这也仅仅是无用的令戒：🐮🐎',
          name: '造物主动态桌面Ⅰ群',
          time: '下午4:20',
          count: "+99"));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/2y/wallhaven-2y6w5y.jpg',
          msg: '花开富贵:(❁´◡`❁)',
          name: 'C# WPF ASP.NET',
          time: '上午9:40',
          count: "1"));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/we/wallhaven-we3wz6.jpg',
          msg: '你摩托车怎么办呢',
          name: '宋涛',
          time: '下午4:33'));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/yx/wallhaven-yx2lxl.png',
          msg: '楼下两个人打起来了',
          name: 'temp',
          time: '下午13:16'));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/yx/wallhaven-yxkw7d.jpg',
          msg: '还没有篮子',
          name: '王怀晨',
          time: '下午16:05'));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/rr/wallhaven-rreejm.jpg',
          msg: '轩宝：[聊天记录]',
          name: '轩宝',
          time: '星期一11:21',
          count: "1"));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/7p/wallhaven-7pxx99.png',
          msg: '[图片][图片][图片]',
          name: '小号',
          time: '昨天晚上9:03'));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/7p/wallhaven-7pxxj9.jpg',
          msg: '八嘎の君：八嘎八嘎八嘎,真是小八嘎呢~~',
          name: '八嘎の君',
          time: '下午12:14',
          count: "5"));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/m3/wallhaven-m3oyx8.jpg',
          msg: '牛牛超人：[图片]',
          name: '发哥是0群友是1',
          time: '昨天晚上7:30'));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/5g/wallhaven-5gpwd7.jpg',
          msg: '7_bit：皮肤都没有',
          name: '六号、！、7_bit（3）',
          time: '晚上7:30',
          count: "3"));
      data.add(MsgModel(
          imageurl: 'https://w.wallhaven.cc/full/zy/wallhaven-zyvg1j.png',
          msg: '[聊天记录]',
          name: '胖胖',
          time: '昨天19:10'));
      setState(() {
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double top = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      extendBodyBehindAppBar: true,
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
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "7_bit",
                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(boxShadow: const [
                            BoxShadow(color: Color.fromARGB(255, 20, 250, 27)),
                            BoxShadow(color: Color.fromARGB(255, 40, 248, 47))
                          ], borderRadius: BorderRadius.circular(5)),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "在线-WIFI",
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    ),
                  ],
                )),
                SvgPicture.asset(
                  "assets/svg/cloud.svg",
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                MyMeun(
                    context: context,
                    offsetdy: 60,
                    offsetWidth: 180,
                    child: SvgPicture.asset(
                      "assets/svg/plus-sm.svg",
                      color: Colors.black,
                      width: 25,
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
                  child: Hero(
                    tag: "Search",
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey))
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Get.to(const UserDevicePage(),
                        transition: Transition.rightToLeft);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      SvgPicture.asset("assets/svg/Monitor.svg",
                          color: Colors.grey),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: SizedBox(
                          child: Text(
                            "已登录 Windows",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
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
                loading
                    ? ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Get.to(
                                    MessageDetailsPage(msgModel: data[index]),
                                    transition: Transition.rightToLeft);
                              },
                              child: msgItem1(data[index]));
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 15);
                        },
                        itemCount: data.length)
                    : Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor:
                            const Color.fromARGB(255, 240, 240, 240),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                        ))
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget msgItem1(MsgModel model) {
    Widget loading = Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: const Color.fromARGB(255, 240, 240, 240),
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.white,
        ));

    return Container(
      color: Colors.transparent,
      child: Row(
        children: [
          ClipOval(
              child: ExtendedImage.network(
            model.imageurl,
            cache: true,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            loadStateChanged: (state) {
              if (state.extendedImageLoadState == LoadState.loading) {
                return loading;
              } else if (state.extendedImageLoadState == LoadState.failed) {
                return loading;
              }
              return null;
            },
          )),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        model.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        model.msg,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      model.time,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 5),
                    Opacity(
                      opacity: model.count != null ? 1 : 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        constraints:
                            const BoxConstraints(minWidth: 17, minHeight: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          model.count ?? "0",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget msgItem() {
    return Row(
      children: [
        ClipOval(
            child: Image.asset(
          "assets/images/dao.jpg",
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        )),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "造物主动态桌面Ⅰ群",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "八嘎の君：真傻逼啊真傻逼啊真傻逼啊真傻逼啊",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "下午1:20",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    constraints:
                        const BoxConstraints(minWidth: 17, minHeight: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      "+99",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
