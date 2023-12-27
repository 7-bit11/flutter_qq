// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class BLMSerachField extends StatefulWidget {
  final String hint;
  final int? maxLength;
  late String type;
  late TextInputType? textInputType;
  final TextEditingController controller;
  late int codetype;
  late Widget? icon;
  late bool autofocus;
  late void Function(String)? onchange;
  late Color? backgrund;
  late FocusNode? focusNode;
  late void Function(String)? onSubmitted;
  BLMSerachField(this.hint, this.type, this.controller,
      {super.key,
      this.maxLength,
      this.textInputType,
      this.codetype = 1,
      this.icon,
      this.autofocus = false,
      this.onchange,
      this.backgrund,
      this.focusNode,
      this.onSubmitted});
  @override
  State<BLMSerachField> createState() => _SerachFieldState();
}

class _SerachFieldState extends State<BLMSerachField> {
  bool displayClean = false;
  //late var stringText = "".obs;
  late bool obscurebool = true;
  //验证码是否发送
  late bool isFinish = false;
  //倒计时60秒
  int seconds = 60;

  Timer? time;

  late bool phoneFormat = F;

  @override
  void initState() {
    super.initState();
    obscurebool = widget.type == "colse" ||
            widget.type == "userName" ||
            widget.type == "recolse"
        ? false
        : true;
    // debounce(stringText, (callback) {
    // });
    //触发任意焦点或事件监听
    widget.controller.addListener(() {
      checkDisplayClean();
    });
  }

  @override
  void dispose() {
    super.dispose();
    //销毁计时器
    time?.cancel();
  }

  //倒计时
  showTimer() {
    isFinish = true;
    time = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      seconds--;
      if (seconds == 0) {
        time?.cancel(); //清除定时器
        isFinish = false;
        seconds = 60;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    late Widget getsuffix = const SizedBox();

    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: widget.backgrund ?? const Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          widget.icon ?? const SizedBox(),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              onSubmitted: widget.onSubmitted,
              autofocus: widget.autofocus,
              keyboardType: widget.textInputType,
              maxLength: widget.maxLength,
              focusNode: widget.focusNode,
              maxLines: 1,
              onChanged: widget.onchange,
              controller: widget.controller,
              textInputAction: TextInputAction.send,
              onEditingComplete: () {},
              obscureText: obscurebool,
              decoration: InputDecoration(
                isCollapsed: true,
                counterText: "",
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Row(
            children: [
              SizedBox(
                width: 30,
                child: Visibility(
                  visible: displayClean,
                  child: IconButton(
                    iconSize: 20,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      widget.controller.text = "";

                      phoneFormat = F;
                      setState(() {});
                    },
                  ),
                ),
              ),
              getsuffix
            ],
          ),
        ],
      ),
    );
  }

  Widget yesorNo() {
    return widget.controller.text.isNotEmpty && widget.type == "userName" ||
            widget.type == "recolse"
        ? !phoneFormat
            ? SvgPicture.asset("assets/svg/cloud.svg")
            : SvgPicture.asset("assets/svg/edit.svg")
        : const SizedBox();
  }

  void checkDisplayClean() {
    setState(() {
      displayClean = widget.controller.text.isNotEmpty;
    });
  }
}
