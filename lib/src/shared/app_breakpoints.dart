import 'package:responsive_framework/responsive_framework.dart';

enum DeviceScreenType {
  mobileS,
  mobileM,
  mobileL,
  tabletS,
  tabletM,
  tabletL,
  webS,
  webM,
  webL,
}

final List<Breakpoint> appBreakPoints = [
  Breakpoint(start: 0, end: 320, name: DeviceScreenType.mobileS.name),
  Breakpoint(start: 321, end: 400, name: DeviceScreenType.mobileM.name),
  Breakpoint(start: 401, end: 425, name: DeviceScreenType.mobileL.name),
  Breakpoint(start: 426, end: 550, name: DeviceScreenType.tabletS.name),
  Breakpoint(start: 551, end: 600, name: DeviceScreenType.tabletM.name),
  Breakpoint(start: 601, end: 900, name: DeviceScreenType.tabletL.name),
  Breakpoint(start: 901, end: 1024, name: DeviceScreenType.webS.name),
  Breakpoint(start: 1025, end: 1440, name: DeviceScreenType.webM.name),
  Breakpoint(start: 1441, end: 1500, name: DeviceScreenType.webL.name),
];
