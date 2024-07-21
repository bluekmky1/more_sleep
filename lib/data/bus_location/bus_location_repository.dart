import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/common/repository/repository.dart';
import 'bus_location_remote_data_source.dart';

final Provider<BusLocationRepository> busLocationRepositoryProvider =
    Provider<BusLocationRepository>(
  (ProviderRef<BusLocationRepository> ref) =>
      BusLocationRepository(ref.watch(busLocationRemoteDataSourceProvider)),
);

class BusLocationRepository extends Repository {
  const BusLocationRepository(this._busLocationRemoteDataSource);

  final BusLocationRemoteDataSource _busLocationRemoteDataSource;

  // Future<RepositoryResult<List<BusingShopEntity>>> getPendingShopList() async {
  //   try {
  //     return SuccessRepositoryResult<List<BusingShopEntity>>(
  //       data: await _BusRemoteDataSource.getPendingShopList(),
  //     );
  //   } on DioException catch (e) {
  //     return FailureRepositoryResult<List<BusingShopEntity>>(
  //       error: e,
  //       messages: getErrorMessages(e),
  //     );
  //   }
  // }
}
