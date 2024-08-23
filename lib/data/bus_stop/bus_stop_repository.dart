import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/repository/repository.dart';
import '../../core/common/repository/repository_result.dart';
import '../../env/env.dart';
import 'bus_stop_remote_data_source.dart';
import 'entity/bus_entity.dart';
import 'entity/bus_stop_entity.dart';

final Provider<BusStopRepository> busStopRepositoryProvider =
    Provider<BusStopRepository>(
  (ProviderRef<BusStopRepository> ref) =>
      BusStopRepository(ref.watch(busStopRemoteDataSourceProvider)),
);

class BusStopRepository extends Repository {
  const BusStopRepository(this._busStopRemoteDataSource);

  final BusStopRemoteDataSource _busStopRemoteDataSource;

  // 정류소 번호 목록 조회
  Future<RepositoryResult<BusStopEntity>> getBusStopList({
    required String nodeId,
    required String routeId,
  }) async {
    try {
      return SuccessRepositoryResult<BusStopEntity>(
        data: await _busStopRemoteDataSource.getBusStopList(
            serviceKey: Env.openDataPortalServiceKey,
            pageNumber: '1',
            numberOfRows: '10',
            dataType: 'json',
            cityCode: '25',
            nodeName: 'aaa'),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<BusStopEntity>(
            error: e,
            messages: <String>['불러오는데 실패했습니다.'],
          ),
      };
    }
  }

  // 정류소 별 경유 노선 목록 조회
  Future<RepositoryResult<BusEntity>> getTransitBusByBusStopId({
    required String cityCode,
    required String nodeId,
  }) async {
    try {
      return SuccessRepositoryResult<BusEntity>(
        data: await _busStopRemoteDataSource.getTransitBusByBusStopId(
            serviceKey: Env.openDataPortalServiceKey,
            pageNumber: '1',
            numberOfRows: '10',
            dataType: 'json',
            cityCode: cityCode,
            nodeId: nodeId),
      );
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;

      return switch (statusCode) {
        _ => FailureRepositoryResult<BusEntity>(
            error: e,
            messages: <String>['1대1 문의 답변 작성에 실패했습니다.'],
          ),
      };
    }
  }
}
