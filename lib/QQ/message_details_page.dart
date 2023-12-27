// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qq/QQ/model/msg_model.dart';
import 'package:flutter_qq/QQ/model/user_send_user_msg_model.dart';
import 'package:flutter_qq/QQ/widget/serach_field.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class MessageDetailsPage extends StatefulWidget {
  const MessageDetailsPage({super.key, required this.msgModel});
  final MsgModel msgModel;

  @override
  State<MessageDetailsPage> createState() => _MessageDetailsPageState();
}

class _MessageDetailsPageState extends State<MessageDetailsPage> {
  late TextEditingController textEditingController = TextEditingController();
  late bool displaySend = false;
  late String me =
      "https://foruda.gitee.com/avatar/1677180609201628769/9580418_zhangnull_1639032531.png";
  late List<UserSendUserMsgModel> msgs = [];

  void addData() {
    msgs.add(UserSendUserMsgModel(
      imageurl: widget.msgModel.imageurl,
      role: "you",
      msg: '可以把',
    ));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl,
        msg: 'https://w.wallhaven.cc/full/zy/wallhaven-zyvg1j.png',
        role: "you",
        type: "image"));

    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl,
        msg: 'https://w.wallhaven.cc/full/d6/wallhaven-d6vp7m.jpg',
        role: "you",
        type: "image"));
    msgs.add(UserSendUserMsgModel(
      imageurl: me,
      msg: '来点摄图',
    ));
    msgs.add(UserSendUserMsgModel(
      imageurl: me,
      msg: '你配个机霸',
    ));
    msgs.add(UserSendUserMsgModel(
        imageurl: me,
        msg: 'https://w.wallhaven.cc/full/7p/wallhaven-7pxx99.png',
        type: "image"));

    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl,
        msg: '感觉我这种臭鱼烂虾进去要坐大牢',
        role: "you"));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl, msg: '这里的invoke没有啊', role: "you"));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl,
        msg:
            '我的识别码:364819064使用向日葵即可对我发起远程协助向日葵下载地址:http://url.oray.com/tGJdas/',
        role: "you"));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl, msg: '谢谢你，大屌侠', role: "you"));

    msgs.add(UserSendUserMsgModel(
      imageurl: me,
      msg: '所以说，点不出来就等于没有吗',
    ));
    msgs.add(UserSendUserMsgModel(
      imageurl: me,
      msg: '眼睛不要可以捐了',
    ));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl, msg: '唉，我是傻逼！', role: "you"));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl, msg: '我感觉这些东西我不太配', role: "you"));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl,
        msg: '我真的他妈的开始找的时候有点心虚了',
        role: "you"));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl, msg: '我感觉我不配', role: "you"));
    msgs.add(UserSendUserMsgModel(
      imageurl: me,
      msg: '你行个机霸',
    ));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl, msg: '我得问问啥情况', role: "you"));
    msgs.add(UserSendUserMsgModel(
        imageurl: widget.msgModel.imageurl, msg: '我感觉我真不太行', role: "you"));
  }

  late bool isdisplay = false;
  late double height = 0;
  late ScrollController scrollController = ScrollController();
  //实例化
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    addData();
    //监听输入框的焦点，是否弹出选项列表
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        displaySend = true;
        if (isdisplay) {
          height = 0;
        }
        setState(() {});
      }
    });
    //监听滚动到底后，列表拉到指定位置输入框获取焦点
    scrollController.addListener(() {
      if (scrollController.offset < -130) {
        FocusScope.of(context).requestFocus(focusNode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: PreferredSize(
        preferredSize: const Size(0, 60),
        child: getFilterWidget(
          child: Container(
            color: const Color.fromARGB(100, 255, 255, 255),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: const BackButton(
                style: ButtonStyle(
                    overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              ),
              leadingWidth: 70,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.msgModel.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(boxShadow: const [
                          BoxShadow(color: Color.fromARGB(255, 20, 250, 27)),
                          BoxShadow(color: Color.fromARGB(255, 40, 248, 47))
                        ], borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(width: 5),
                      const Text("手机在线 - 4G", style: TextStyle(fontSize: 10))
                    ],
                  )
                ],
              ),
              actions: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  highlightColor: Colors.white.withOpacity(.1),
                  icon: Container(
                    constraints: BoxConstraints.tight(const Size(30, 30)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0),
                    ),
                    child: const Icon(
                      Icons.qr_code,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  highlightColor: Colors.black.withOpacity(.1),
                  icon: Container(
                    constraints: BoxConstraints.tight(const Size(30, 30)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0),
                    ),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                )
              ],
            ),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (isdisplay) {
                    isdisplay = !isdisplay;
                    height = 0;
                  }
                  displaySend = textEditingController.text.isNotEmpty;
                  if (mounted) setState(() {});
                  setState(() {});
                },
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  reverse: true,
                  shrinkWrap: true,
                  controller: scrollController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  itemCount: msgs.length,
                  itemBuilder: (context, index) {
                    return DefaultTextStyle(
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        child: item(msgs[index]));
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 20);
                  },
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(255, 247, 247, 247),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.mic_none_outlined),
                  const SizedBox(width: 5),
                  Expanded(
                    child: BLMSerachField(
                      "",
                      "colse",
                      textEditingController,
                      autofocus: false,
                      textInputType: TextInputType.text,
                      focusNode: focusNode,
                      onSubmitted: (p0) {
                        if (p0.isEmpty) return;
                        msgs.insert(
                            0, UserSendUserMsgModel(imageurl: me, msg: p0));
                        textEditingController.clear();
                        //displaySend = false;
                        Future.delayed(const Duration(seconds: 2), () {
                          msgs.insert(
                              0,
                              UserSendUserMsgModel(
                                  imageurl: widget.msgModel.imageurl,
                                  role: "you",
                                  msg: "${widget.msgModel.name}:$p0"));
                          setState(() {});
                        });
                        setState(() {});
                      },
                      onchange: (text) {
                        displaySend = textEditingController.text.isNotEmpty;
                        if (mounted) setState(() {});
                      },
                      backgrund: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SvgPicture.asset(
                    "assets/svg/Star-Struck.svg",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 10),
                  !displaySend
                      ? GestureDetector(
                          onTap: () {
                            isdisplay = !isdisplay;
                            if (isdisplay) {
                              height = 300;
                              scrollController.animateTo(-20,
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 500));
                            } else {
                              height = 0;
                            }
                            //FocusScope.of(context).requestFocus(FocusNode());

                            setState(() {});
                          },
                          child: SvgPicture.asset(
                            "assets/svg/Add_Plus_Circle.svg",
                            color: !isdisplay ? Colors.black : Colors.blue,
                          ),
                        )
                      : SizedBox(
                          width: 60,
                          height: 30,
                          child: ElevatedButton(
                            onPressed: () {
                              if (textEditingController.text.isEmpty) return;
                              msgs.insert(
                                  0,
                                  UserSendUserMsgModel(
                                      imageurl: me,
                                      msg: textEditingController.text));
                              String youtext = textEditingController.text;
                              textEditingController.clear();
                              //displaySend = false;

                              scrollController.animateTo(0,
                                  curve: Curves.ease,
                                  duration: const Duration(milliseconds: 300));
                              Future.delayed(const Duration(seconds: 2), () {
                                msgs.insert(
                                    0,
                                    UserSendUserMsgModel(
                                        imageurl: widget.msgModel.imageurl,
                                        role: "you",
                                        msg:
                                            "${widget.msgModel.name}:$youtext"));
                                setState(() {});
                              });

                              setState(() {});
                            },
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(
                                    EdgeInsets.zero),
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.blue.shade400)),
                            child: const Text(
                              "发送",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                  const SizedBox(width: 5)
                ],
              ),
            ),
            AnimatedContainer(
                height: height,
                color: const Color.fromARGB(255, 247, 247, 247),
                padding: const EdgeInsets.only(top: 20),
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: StaggeredGrid.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 4,
                  children: [
                    myDisplayItem(svg: 'folder', name: '文件'),
                    myDisplayItem(svg: 'upload 1', name: '微云'),
                    myDisplayItem(svg: 'picture', name: '相册'),
                    myDisplayItem(svg: 'bookmark', name: '收藏'),
                    myDisplayItem(svg: 'tethering 1', name: '王卡'),
                    myDisplayItem(svg: 'desktop 1', name: '我的电脑'),
                    myDisplayItem(svg: 'controller 1', name: '游戏中心'),
                    myDisplayItem(svg: 'QQ', name: 'QQ')
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget item(UserSendUserMsgModel userMsgModel) {
    double width = MediaQuery.sizeOf(Get.context!).width * .7;
    Widget loading = Shimmer.fromColors(
        baseColor: Colors.white,
        highlightColor: const Color.fromARGB(255, 240, 240, 240),
        child: Container(
          height: 50,
          width: double.infinity,
          color: Colors.white,
        ));
    return userMsgModel.role == "i"
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userMsgModel.type == "text"
                  ? Container(
                      constraints: BoxConstraints(maxWidth: width),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        userMsgModel.msg,
                        style: const TextStyle(color: Colors.white),
                      ))
                  : GestureDetector(
                      onTap: () {
                        showDialog(
                            builder: (BuildContext context) {
                              return DetailPage(userMsgModel.msg);
                            },
                            context: context);
                      },
                      child: Container(
                        constraints: BoxConstraints(maxWidth: width),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ExtendedImage.network(
                            userMsgModel.msg,
                            cache: true,
                            loadStateChanged: (state) {
                              if (state.extendedImageLoadState ==
                                  LoadState.loading) {
                                return loading;
                              } else if (state.extendedImageLoadState ==
                                  LoadState.failed) {
                                return loading;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
              const SizedBox(width: 10),
              ClipOval(
                  child: ExtendedImage.network(
                userMsgModel.imageurl,
                cache: true,
                width: 35,
                height: 35,
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
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                  child: ExtendedImage.network(
                userMsgModel.imageurl,
                cache: true,
                width: 35,
                height: 35,
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
              userMsgModel.type == "text"
                  ? Container(
                      constraints: BoxConstraints(maxWidth: width),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        userMsgModel.msg,
                        style: const TextStyle(color: Colors.black),
                      ))
                  : GestureDetector(
                      onTap: () {
                        showDialog(
                            builder: (BuildContext context) {
                              return DetailPage(userMsgModel.msg);
                            },
                            context: context);
                      },
                      child: Container(
                        constraints: BoxConstraints(maxWidth: width),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ExtendedImage.network(
                            userMsgModel.msg,
                            cache: true,
                            loadStateChanged: (state) {
                              if (state.extendedImageLoadState ==
                                  LoadState.loading) {
                                return loading;
                              } else if (state.extendedImageLoadState ==
                                  LoadState.failed) {
                                return loading;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    )
            ],
          );
  }
}

Widget myDisplayItem({required String svg, required String name}) {
  return SizedBox(
    child: Column(children: [
      SvgPicture.asset(
        "assets/svg/$svg.svg",
        width: 25,
      ),
      Text(name, style: const TextStyle(fontWeight: FontWeight.w300))
    ]),
  );
}

Widget getFilterWidget({
  Widget? child,
  double sigmaX = 20,
  double sigmaY = 20,
}) {
  return ClipRect(
    //背景模糊化
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: sigmaX,
        sigmaY: sigmaY,
      ),
      child: child,
    ),
  );
}

class DetailPage extends StatefulWidget {
  const DetailPage(this.url, {super.key});
  final String url;
  @override
  State<DetailPage> createState() => _NewDetailPageState();
}

class _NewDetailPageState extends State<DetailPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: ExtendedImageSlidePage(
        slideAxis: SlideAxis.both,
        slideType: SlideType.onlyImage,
        slidePageBackgroundHandler: (offset, pageSize) {
          return Colors.transparent;
        },
        resetPageDuration: const Duration(milliseconds: 200),
        child: ExtendedImageGesturePageView(
          children: [
            ExtendedImage.network(
              widget.url,
              fit: BoxFit.contain,
              enableSlideOutPage: true,
              heroBuilderForSlidingPage: (image) => Hero(
                tag: widget.url,
                flightShuttleBuilder: (
                  flightContext,
                  animation,
                  flightDirection,
                  fromHeroContext,
                  toHeroContext,
                ) {
                  final hero = (flightDirection == HeroFlightDirection.pop
                      ? fromHeroContext.widget
                      : toHeroContext.widget) as Hero;
                  return hero.child;
                },
                child: image,
              ),
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (s) {
                return GestureConfig(
                    minScale: 0.9,
                    animationMinScale: 0.7,
                    maxScale: 5.0,
                    animationMaxScale: 5.5,
                    speed: 1.0,
                    inertialSpeed: 100.0,
                    initialScale: 1.0,
                    inPageView: false);
              },
              loadStateChanged: (state) {
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
