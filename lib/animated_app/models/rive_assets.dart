import 'package:rive/rive.dart';

class RiveAsset {
  final String src, artboard, stateMachineName, title;
  late SMIBool? input;

  RiveAsset({
    required this.src,
    required this.title,
    required this.artboard,
    required this.stateMachineName,
    this.input,
  });

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset(
    src: 'assets/animated_app/RiveAssets/icons.riv',
    title: 'Chat',
    artboard: 'CHAT',
    stateMachineName: 'CHAT_Interactivity',
  ),
  RiveAsset(
    src: 'assets/animated_app/RiveAssets/icons.riv',
    title: 'Search',
    artboard: 'SEARCH',
    stateMachineName: 'SEARCH_Interactivity',
  ),
  RiveAsset(
    src: 'assets/animated_app/RiveAssets/icons.riv',
    title: 'Timer',
    artboard: 'TIMER',
    stateMachineName: 'TIMER_Interactivity',
  ),
  RiveAsset(
    src: 'assets/animated_app/RiveAssets/icons.riv',
    title: 'Bell',
    artboard: 'BELL',
    stateMachineName: 'BELL_Interactivity',
  ),
  RiveAsset(
    src: 'assets/animated_app/RiveAssets/icons.riv',
    title: 'User',
    artboard: 'USER',
    stateMachineName: 'USER_Interactivity',
  ),
];

List<RiveAsset> sideMenu1 = [
  RiveAsset(
      title: "Home", src: "assets/animated_app/RiveAssets/icons.riv", artboard: "HOME", stateMachineName: "HOME_interactivity"),
  RiveAsset(
      title: "Search",
      src: "assets/animated_app/RiveAssets/icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity"),
  RiveAsset(
      title: "Favorites",
      src: "assets/animated_app/RiveAssets/icons.riv",
      artboard: "LIKE/STAR",
      stateMachineName: "STAR_Interactivity"),
  RiveAsset(
      title: "Help", src: "assets/animated_app/RiveAssets/icons.riv", artboard: "CHAT", stateMachineName: "CHAT_Interactivity"),
];
List<RiveAsset> sideMenus2 = [
  RiveAsset(
    src: 'assets/animated_app/RiveAssets/icons.riv',
    title: 'History',
    artboard: 'TIMER',
    stateMachineName: 'TIMER_Interactivity',
  ),
  RiveAsset(
    src: 'assets/animated_app/RiveAssets/icons.riv',
    title: 'Notifications',
    artboard: 'BELL',
    stateMachineName: 'BELL_Interactivity',
  ),
];
