// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_qq/QQ/widget/appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserDevicePage extends StatefulWidget {
  const UserDevicePage({super.key});

  @override
  State<UserDevicePage> createState() => _UserDevicePageState();
}

class _UserDevicePageState extends State<UserDevicePage> {
  late bool checkboxValue = false;
  late bool cupertinoSwitchValue = true;
  @override
  Widget build(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: StudyAppBar.MyAppBar("已登录设备", context,
          toolbarHeight: top + 20,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          textStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Image.asset(
            "assets/images/Eclipse (1).png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: top + 60,
                ),
                ClipOval(
                  child: Image.asset(
                    "assets/images/bit7.jpg",
                    fit: BoxFit.cover,
                    height: 60,
                    width: 60,
                    alignment: Alignment.topCenter,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "7_bit",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 253, 253, 253),
                      borderRadius: BorderRadius.circular(5)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SvgPicture.asset(
                        "assets/svg/airplay.svg",
                        color: Colors.black12,
                        width: 70,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "QQ Windows版",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "ZY-PC",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          checkboxValue = !checkboxValue;
                          setState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: Transform.scale(
                                scale: .74,
                                child: Checkbox(
                                  value: checkboxValue,
                                  checkColor: Colors.white,
                                  fillColor: const MaterialStatePropertyAll(
                                      Colors.blue),
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  shape: const CircleBorder(),
                                  onChanged: (boo) {},
                                ),
                              ),
                            ),
                            const Text(
                              "下次登录无需手机登录",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: BorderSide(
                                        color: Colors.grey.shade300, width: .3),
                                    right: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: .15),
                                  )),
                                  child: const Text(
                                    "传文件",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ))),
                          Expanded(
                              child: Container(
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: BorderSide(
                                        color: Colors.grey.shade300, width: .3),
                                    left: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: .15),
                                  )),
                                  child: const Text(
                                    "退出登录",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ))),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 253, 253, 253),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "手机通知",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "关闭后，手机上收到消息不提醒",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Switch(
                        activeTrackColor: Colors.blue,
                        inactiveThumbColor: Colors.blue,
                        inactiveTrackColor: Colors.white,
                        hoverColor: Colors.white,
                        value: cupertinoSwitchValue,
                        onChanged: (value) {
                          setState(() {
                            cupertinoSwitchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
