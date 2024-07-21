import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import '../../service/network/bus_api_service.dart';
import 'entity/bus_stop_entity.dart';

part 'generated/bus_stop_remote_data_source.g.dart';

final Provider<BusStopRemoteDataSource> busStopRemoteDataSourceProvider =
    Provider<BusStopRemoteDataSource>(
  (ProviderRef<BusStopRemoteDataSource> ref) =>
      BusStopRemoteDataSource(ref.read(busApiServiceProvider)),
);

@RestApi()
abstract class BusStopRemoteDataSource {
  factory BusStopRemoteDataSource(Dio dio) = _BusStopRemoteDataSource;

  // 정류소 번호 목록 조회
  @GET('BusSttnInfoInqireService/getSttnNoList')
  Future<BusStopEntity> getBusStopList({
    @Query('serviceKey') required String serviceKey,
    @Query('pageNo') required String pageNumber,
    @Query('numOfRows') required String numberOfRows,
    @Query('_type') required String dataType,
    @Query('cityCode') required String cityCode,
    @Query('nodeNm') required String nodeName,
  });
}
