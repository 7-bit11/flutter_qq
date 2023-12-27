// ignore_for_file: deprecated_member_use

import 'package:auto_size_text/auto_size_text.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qq/QQ/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class UserInformationPage extends StatefulWidget {
  const UserInformationPage({super.key});

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  double imageheight = 200;

  double extrapicHeight = 0;

  double dy = 0;

  late AnimationController animatedContainer;

  late Animation<double> animation;

  List<String> imageurl = [];

  late int count = 1024;

  late Animation<double> countAnimation;

  late double counticon = 18;

  late AnimationController countanimatedContainer;

  void updateHeight(double position) {
    if (dy == 0) {
      dy = position;
    }
    var extrapicHeight1 = extrapicHeight + position - dy;
    if (extrapicHeight1 <= -150 || extrapicHeight1 >= 200) {
      return;
    }
    extrapicHeight += position - dy;
    setState(() {
      dy = position;
      extrapicHeight = extrapicHeight;
    });
  }

  void runAnimate() {
    setState(() {
      animation =
          Tween(begin: extrapicHeight, end: .0).animate(animatedContainer)
            ..addListener(() {
              setState(() {
                extrapicHeight = animation.value;
              });
            });
      dy = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    animatedContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    countanimatedContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animation = Tween(begin: 0.0, end: 0.0).animate(animatedContainer);
    List.generate(13, (index) {
      imageurl.add("assets/images/${index + 1}.png");
    });
    countAnimation =
        Tween(begin: 1.0, end: 1.2).animate(countanimatedContainer);
  }

  @override
  void dispose() {
    if (mounted) {
      animatedContainer.dispose();
      countanimatedContainer.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      extendBodyBehindAppBar: true,
      appBar: StudyAppBar.MyAppBar("", context,
          backgroundColor: Colors.transparent,
          leading: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black.withOpacity(.2),
            ),
            margin: const EdgeInsets.all(10),
            child: const BackButton(
              color: Colors.white,
              style: ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              highlightColor: Colors.white.withOpacity(.1),
              icon: Container(
                constraints: BoxConstraints.tight(const Size(35, 35)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black.withOpacity(.2),
                ),
                child: const Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
              ),
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              highlightColor: Colors.white.withOpacity(.1),
              icon: Container(
                constraints: BoxConstraints.tight(const Size(35, 35)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.black.withOpacity(.2),
                ),
                child: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
              ),
              style: const ButtonStyle(
                  padding: MaterialStatePropertyAll(EdgeInsets.zero)),
            )
          ]),
      body: Listener(
        onPointerMove: (event) {
          updateHeight(event.position.dy / 2);
        },
        onPointerUp: (value) {
          runAnimate();
          animatedContainer.forward(from: .0);
        },
        child: Stack(
          children: [
            GestureDetector(
                onTap: () {
                  showDialog(
                      builder: (BuildContext context) {
                        return const DetailPage("assets/images/dao.jpg");
                      },
                      context: context);
                },
                child: ExtendedImage.asset(
                  "assets/images/dao.jpg",
                  height: imageheight + extrapicHeight,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  loadStateChanged: (state) {
                    if (state.extendedImageLoadState == LoadState.loading) {
                      return Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 240, 240, 240),
                          highlightColor: Colors.white,
                          child: Container(
                            height: imageheight,
                            width: double.infinity,
                            color: Colors.white,
                          ));
                    } else if (state.extendedImageLoadState ==
                        LoadState.failed) {
                      return Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 240, 240, 240),
                          highlightColor: Colors.white,
                          child: Container(
                            height: imageheight,
                            width: double.infinity,
                            color: Colors.white,
                          ));
                    }
                    return null;
                  },
                )
                //  Image.asset(
                //   "assets/images/dao.jpg",
                //   height: imageheight + extrapicHeight,
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                // )
                //  Shimmer.fromColors(
                //   baseColor: Colors.red.withOpacity(.1),
                //   highlightColor: Colors.yellow,
                //   child: Image.asset(
                //     "assets/images/dao.jpg",
                //     height: imageheight + extrapicHeight,
                //     fit: BoxFit.cover,
                //     width: double.infinity,
                //   )),
                ),
            ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: imageheight - 30 + extrapicHeight,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    builder:
                                                        (BuildContext context) {
                                                      return const DetailPage(
                                                          "assets/images/bit7.jpg");
                                                    },
                                                    context: context);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                child: Hero(
                                                  tag: "assets/images/bit7.jpg",
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      "assets/images/bit7.jpg",
                                                      alignment:
                                                          Alignment.topCenter,
                                                      fit: BoxFit.cover,
                                                      width: 70,
                                                      height: 70,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Shimmer.fromColors(
                                                  baseColor: Colors.black,
                                                  highlightColor: Colors.red,
                                                  child: const Text(
                                                    "7_bit",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                                const Text.rich(
                                                  TextSpan(children: [
                                                    TextSpan(
                                                        text: "QQ号：210014468",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.grey)),
                                                    TextSpan(
                                                        text: " (ID：BitSeven)")
                                                  ]),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const SizedBox(height: 5),
                                            GestureDetector(
                                              onTap: () {
                                                countanimatedContainer.repeat(
                                                    reverse: true);
                                              },
                                              child: ScaleTransition(
                                                scale: countAnimation,
                                                child: SvgPicture.asset(
                                                  "assets/svg/favorite.svg",
                                                  width: counticon,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              "$count",
                                              style:
                                                  const TextStyle(fontSize: 13),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    height: 50,
                                    child: Row(
                                      children: [
                                        const Flexible(
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                child: Icon(
                                                  Icons.male,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Flexible(
                                                child: Text.rich(
                                                  TextSpan(children: [
                                                    TextSpan(text: "男"),
                                                    TextSpan(text: " | "),
                                                    TextSpan(text: "1024岁"),
                                                    TextSpan(text: " | "),
                                                    TextSpan(text: "巨蟹座"),
                                                    TextSpan(text: " | "),
                                                    TextSpan(text: "来自中国"),
                                                    TextSpan(text: " | "),
                                                    TextSpan(text: "IT"),
                                                  ]),
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/chevronright.svg",
                                          height: 30,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              const Flexible(
                                                child: Text(
                                                  "sex robot",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              SvgPicture.asset(
                                                "assets/svg/edit.svg",
                                                height: 15,
                                                color: Colors.grey,
                                              )
                                            ],
                                          ),
                                        ),
                                        SvgPicture.asset(
                                          "assets/svg/chevronright.svg",
                                          height: 30,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              height: 50,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          "assets/svg/document 1.svg",
                                          width: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        const Expanded(
                                          child: Text(
                                            "资料完成度80%",
                                            style: TextStyle(fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        "去完善",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      SvgPicture.asset(
                                        "assets/svg/chevronright.svg",
                                        height: 30,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter, //渐变开始于上面的中间开始
                                    end: Alignment.bottomCenter, //渐变结束于下面的中间
                                    colors: [
                                      Colors.white,
                                      Color.fromARGB(255, 250, 250, 250)
                                    ]),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/Star.svg",
                                              width: 18,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 10),
                                            const Expanded(
                                              child: Text(
                                                "QQ空间",
                                                style: TextStyle(fontSize: 15),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "分享新鲜事",
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          SvgPicture.asset(
                                            "assets/svg/chevronright.svg",
                                            height: 30,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    height: 100,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(3),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (c, i) {
                                          return GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  builder:
                                                      (BuildContext context) {
                                                    return DetailPage(
                                                        imageurl[i]);
                                                  },
                                                  context: context);
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              child: ExtendedImage.asset(
                                                imageurl[i],
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                                loadStateChanged: (state) {
                                                  if (state
                                                          .extendedImageLoadState ==
                                                      LoadState.loading) {
                                                    return Container(
                                                        color: Colors.white,
                                                        height: 100,
                                                        width: 100);
                                                  } else if (state
                                                          .extendedImageLoadState ==
                                                      LoadState.failed) {
                                                    return Container(
                                                        color: Colors.white,
                                                        height: 100,
                                                        width: 100);
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                        itemCount: imageurl.length,
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return const SizedBox(
                                            width: 5,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "assets/svg/More_Grid_Big.svg",
                                              width: 18,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(width: 10),
                                            const Expanded(
                                              child: Text(
                                                "精选照片",
                                                style: TextStyle(fontSize: 15),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "添加精美照片、展示个性的你",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          SvgPicture.asset(
                                            "assets/svg/chevronright.svg",
                                            height: 30,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 100),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.grey.shade400, width: .8),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white)),
                        child: const AutoSizeText(
                          '个性名片',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              elevation: const MaterialStatePropertyAll(0),
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.grey.shade400, width: .8),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.white)),
                          child: const AutoSizeText(
                            '编辑资料',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            maxLines: 1,
                          )),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue.shade400)),
                        child: const Text(
                          "发消息",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
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
            ExtendedImage.asset(
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
