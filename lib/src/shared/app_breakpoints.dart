import 'package:responsive_framework/responsive_framework.dart';

/// Represents the type of device screen based on its width.
///
/// This enum is used to categorize devices into different screen types,
/// such as mobile, tablet, and web, with further subdivisions based on screen width.
enum DeviceScreenType {
  /// Small mobile devices (0 - 320px).
  mobileS,

  /// Medium mobile devices (321 - 400px).
  mobileM,

  /// Large mobile devices (401 - 425px).
  mobileL,

  /// Small tablet devices (426 - 550px).
  tabletS,

  /// Medium tablet devices (551 - 600px).
  tabletM,

  /// Large tablet devices (601 - 900px).
  tabletL,

  /// Small web devices (901 - 1024px).
  webS,

  /// Medium web devices (1025 - 1440px).
  webM,

  /// Large web devices (1441 - 1500px).
  webL,
}

/// A list of breakpoints for responsive design.
///
/// These breakpoints define the screen width ranges for different device types.
/// They are used to adapt the app's layout and UI for various screen sizes.
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
