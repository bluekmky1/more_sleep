import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import '../../service/network/bus_api_service.dart';

part 'generated/bus_location_remote_data_source.g.dart';

final Provider<BusLocationRemoteDataSource>
    busLocationRemoteDataSourceProvider = Provider<BusLocationRemoteDataSource>(
  (ProviderRef<BusLocationRemoteDataSource> ref) =>
      BusLocationRemoteDataSource(ref.read(busApiServiceProvider)),
);

@RestApi()
abstract class BusLocationRemoteDataSource {
  factory BusLocationRemoteDataSource(Dio dio) = _BusLocationRemoteDataSource;

  // 노선별 버스 위치 목록 조회
  @GET('/BusLcInfoInqireService/getRouteAcctoBusLcList')
  Future<void> getBusLocationList({
    @Query('pageNo') required String pageNumber,
    @Query('numOfRows') required String numberOfRows,
    @Query('_type') required String dataType,
    @Query('routeId') required String routeId,
    @Query('cityCode') required String cityCode,
  });

  // 노선별 특정 정류소 접근 버스 위치 정보 조회
  @GET('/BusLcInfoInqireService/getRouteAcctoSpcifySttnAccesBusLcInfo')
  Future<void> getApproachingBusLocation({
    @Query('pageNo') required String pageNumber,
    @Query('numOfRows') required String numberOfRows,
    @Query('_type') required String dataType,
    @Query('routeId') required String routeId,
    @Query('nodeId') required String nodeId,
    @Query('cityCode') required String cityCode,
  });
}
