import 'package:calls/pages/constants.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class Callpage extends StatelessWidget {
  final String callId;
  final String userId;

  const Callpage({
    super.key,
    required this.callId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: Appinfo.appId,
      appSign: Appinfo.appSign,
      userID: userId,
      userName: userId,
      callID: callId,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
