part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const LAYOUT = _Paths.LAYOUT;
  static const ADD_FRIEND = _Paths.ADD_FRIEND;
  static const FRIEND_INFO = _Paths.FRIEND_INFO;
  static const CHART = _Paths.CHART;
  static const WEB_VIEW = _Paths.WEB_VIEW;
  static const CIRCLE_DETAILS = _Paths.CIRCLE_DETAILS;
  static const CIRCLE_SEND = _Paths.CIRCLE_SEND;
  static const CIRCLE_SEPARATE = _Paths.CIRCLE_SEPARATE;
  static const MY_CODE = _Paths.MY_CODE;
  static const SETTING = _Paths.SETTING;
  static const SET_ACCOUNT = _Paths.SET_ACCOUNT;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const LAYOUT = '/layout';
  static const ADD_FRIEND = '/addFriend';
  static const FRIEND_INFO = '/friendInfo';
  static const CHART = '/chart';
  static const WEB_VIEW = '/webView';
  static const CIRCLE_DETAILS = '/circleDetails';
  static const CIRCLE_SEND = '/circleSend';
  static const CIRCLE_SEPARATE = '/circleSeparate';
  static const MY_CODE = '/myCode';
  static const SETTING = '/setting';
  static const SET_ACCOUNT = '/setAccount';
}
