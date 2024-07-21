import 'route_info.dart';

class Routes {
  // 홈(메인)페이지
  static const RouteInfo home = RouteInfo(
    name: '/home',
    path: '/home',
  );

  // 알람 추가 페이지
  static const RouteInfo addAlarm = RouteInfo(
    name: '/home/add-alarm',
    path: 'add-alarm',
  );
}
