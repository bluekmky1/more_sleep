import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/repository/repository.dart';
import '../../core/common/repository/repository_result.dart';
import '../../env/env.dart';
import 'bus_stop_remote_data_source.dart';
import 'entity/bus_stop_entity.dart';

final Provider<BusLocationRepository> busLocationRepositoryProvider =
    Provider<BusLocationRepository>(
  (ProviderRef<BusLocationRepository> ref) =>
      BusLocationRepository(ref.watch(busStopRemoteDataSourceProvider)),
);

class BusLocationRepository extends Repository {
  const BusLocationRepository(this._busStopRemoteDataSource);

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
            messages: <String>['1대1 문의 답변 작성에 실패했습니다.'],
          ),
      };
    }
  }
}
