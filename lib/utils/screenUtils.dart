enum DeviceType{
  mobile,
  tablet,
  desktop
}
class Screenutils{
  static const mobileMaxSize = 640;
  static const tabletMaxSize = 1007;

  static DeviceType getDeviceType(double width){
    if(width <= mobileMaxSize) return DeviceType.mobile;
    else if(width > mobileMaxSize && width <= tabletMaxSize) return DeviceType.tablet;
    else return DeviceType.desktop;
  }
}
