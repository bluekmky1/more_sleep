import 'package:more_sleep/routes/route_info.dart';

class Routes {
  // 홈(메인)페이지
  static const RouteInfo home = RouteInfo(
    name: '/home',
    path: '/home',
  );

  // 버스 추가 페이지
  static const RouteInfo addBus = RouteInfo(
    name: '/home/addBus',
    path: 'addBus',
  );
}
