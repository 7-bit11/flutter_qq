import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget MyMeun(
    {required BuildContext context,
    required List<BitMeunItem> items,
    required Widget child,
    Color? barrierColor = Colors.black12,
    Duration? duration,
    //生成容器宽度
    double? offsetWidth,
    bool? isup,
    double? offsetdy}) {
  return Listener(
      onPointerUp: (event) {
        BitMeunshowDialog(
            context: context,
            event: event,
            items: items,
            barrierColor: barrierColor,
            duration: duration,
            offsetWidth: offsetWidth ?? 130,
            isup: isup,
            offsetdy: offsetdy ?? 50);
      },
      child: AbsorbPointer(child: child));
}

// ignore: non_constant_identifier_names
Future<dynamic> BitMeunshowDialog(
    {required BuildContext context,
    required PointerUpEvent event,
    required List<BitMeunItem> items,
    bool barrierDismissible = true,
    Color? barrierColor = Colors.black12,
    String? barrierLabel,
    bool useSafeArea = true,
    Widget Function(BuildContext)? builder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
    Duration? duration,
    //容器宽度
    double? offsetWidth,
    bool? isup,
    double? offsetdy}) {
  Size size = MediaQuery.of(context).size;
  return showDialog(
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      traversalEdgeBehavior: traversalEdgeBehavior,
      builder: (BuildContext context) {
        return BitMeun(
            event: event,
            items: items,
            width: size.width,
            height: size.height,
            duration: duration,
            offsetWidth: offsetWidth ?? 130,
            offsetdy: offsetdy ?? 50,
            isup: isup);
      },
      context: context);
}

//实现组件但是没有拓展最基本的格式
// ignore: must_be_immutable
class BitMeun extends StatefulWidget {
  BitMeun(
      {super.key,
      required this.event,
      required this.items,
      required this.width,
      required this.height,
      this.duration,
      this.isup,
      this.offsetdy = 50,
      this.offsetWidth = 130});
  //生成的坐标
  PointerUpEvent event;
  //图标item
  List<BitMeunItem> items;
  //生成高度坐标
  double? offsetdy;
  //设备宽度
  double width;
  //设备高度
  double height;
  //容器宽度
  double? offsetWidth;
  //动画时间
  Duration? duration;
  //
  bool? isup;
  @override
  State<BitMeun> createState() => _BitMeunState();
}

class _BitMeunState extends State<BitMeun> with TickerProviderStateMixin {
  Offset offset = Offset.zero;

  late AnimationController animatedContainer;

  late Animation<double> animation;

  late Alignment alignment;
  @override
  void dispose() {
    super.dispose();
    animatedContainer.dispose();
  }

  @override
  void initState() {
    super.initState();
    double width = widget.width;
    widget.offsetWidth = widget.offsetWidth ?? 130;
    if (widget.isup ?? true) {
      if (width / 2 > widget.event.position.dx) {
        offset = Offset(20, widget.offsetdy!);
        alignment = Alignment.topLeft;
      } else {
        offset = Offset(width - widget.offsetWidth! - 20, widget.offsetdy!);
        alignment = Alignment.topRight;
      }
    } else {
      if (width / 2 > widget.event.position.dx) {
        offset = Offset(20, widget.height - 270);
        alignment = Alignment.bottomLeft;
      } else {
        offset = Offset(width - widget.offsetWidth! - 20, widget.height - 270);
        alignment = Alignment.bottomRight;
      }
    }

    animatedContainer = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 200))
      ..forward();

    animation = Tween(begin: 0.0, end: 1.0).animate(animatedContainer);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        alignment: alignment,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Transform.translate(
              offset: offset,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                      constraints:
                          BoxConstraints(maxWidth: widget.offsetWidth!),
                      transformAlignment: Alignment.topLeft,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(5))),
                      child: ListView.separated(
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return widget.items[index];
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 12);
                          },
                          itemCount: widget.items.length));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// 展开后的item组件
// ignore: must_be_immutable
class BitMeunItem extends StatelessWidget {
  BitMeunItem(
      {super.key, required this.icon, required this.text, required this.onTap});
  String text;
  Widget icon;
  Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: icon,
            ),
            Expanded(
              flex: 3,
              child: Text(
                text,
                style: const TextStyle(fontSize: 17),
              ),
            )
          ],
        ));
  }
}
