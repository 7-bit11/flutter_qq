// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qq/QQ/widget/appbar.dart';
import 'package:flutter_qq/QQ/widget/serach_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchMessageListPage extends StatefulWidget {
  const SearchMessageListPage({super.key});

  @override
  State<SearchMessageListPage> createState() => _SearchMessageListPageState();
}

class _SearchMessageListPageState extends State<SearchMessageListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: StudyAppBar.MyAppBar(
        "",
        context,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: const SizedBox(),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Hero(
                tag: "Search",
                child: SizedBox(
                  height: 35,
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Expanded(
                          child: BLMSerachField(
                        "搜索",
                        "colse",
                        TextEditingController(),
                        autofocus: true,
                        icon: const Icon(Icons.search, color: Colors.grey),
                      )),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(0),
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        child: const Text(
                          "取消",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 10,
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 245, 245, 245),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    children: [
                      Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                "搜索指定内容",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              ),
                              const Divider(
                                thickness: .2,
                              ),
                              GridView(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                children: [
                                  getItem("User-plus", "找人/群"),
                                  getItem("Group 151", "表情"),
                                  getItem("QQ", "小程序"),
                                  getItem("Expand", "扫一扫")
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

Widget getItem(String svg, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        "assets/svg/$svg.svg",
        color: Colors.black,
      ),
      const SizedBox(height: 5),
      Text(
        text,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      )
    ],
  );
}
