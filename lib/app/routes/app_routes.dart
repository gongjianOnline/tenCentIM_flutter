part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const LAYOUT = _Paths.LAYOUT;
  static const ADD_FRIEND = _Paths.ADD_FRIEND;
  static const FRIEND_INFO = _Paths.FRIEND_INFO;
  static const CHART = _Paths.CHART;
  static const WEB_VIEW = _Paths.WEB_VIEW;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const LAYOUT = '/layout';
  static const ADD_FRIEND = '/addFriend';
  static const FRIEND_INFO = '/friendInfo';
  static const CHART = '/chart';
  static const WEB_VIEW = '/webView';
}
