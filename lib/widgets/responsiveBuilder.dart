import 'package:assignment/utils/screenUtils.dart';
import 'package:flutter/cupertino.dart';

class responsiveBuilder extends StatelessWidget {
  const responsiveBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop
  });

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    final DeviceType deviceType = Screenutils.getDeviceType(size);
    if(deviceType == DeviceType.mobile) return mobile;
    else if(deviceType == DeviceType.tablet)return tablet;
    else return desktop;

  }
}
