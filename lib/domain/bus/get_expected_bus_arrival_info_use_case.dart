import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/repository/repository_result.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../data/bus_arrival/bus_arrival_repository.dart';
import '../../data/bus_arrival/entity/bus_arrival_info_entity.dart';
import 'model/bus_arrival_info_model.dart';

final Provider<GetExpectedBusArrivalInfoUseCase>
    getExpectedBusArrivalInfoUseCaseProvider =
    Provider<GetExpectedBusArrivalInfoUseCase>(
  (ProviderRef<GetExpectedBusArrivalInfoUseCase> ref) =>
      GetExpectedBusArrivalInfoUseCase(
    busArrivalRepository: ref.watch(busArrivalRepositoryProvider),
  ),
);

class GetExpectedBusArrivalInfoUseCase {
  const GetExpectedBusArrivalInfoUseCase({
    required BusArrivalRepository busArrivalRepository,
  }) : _busArrivalRepository = busArrivalRepository;

  final BusArrivalRepository _busArrivalRepository;

  Future<UseCaseResult<BusArrivalInfoModel>> call({
    required String nodeId,
    required String routeId,
  }) async {
    final RepositoryResult<BusArrivalInfoEntity> repositoryResult =
        await _busArrivalRepository.getExpectedBusArrivalInfo(
      nodeId: nodeId,
      routeId: routeId,
    );

    return switch (repositoryResult) {
      SuccessRepositoryResult<BusArrivalInfoEntity>() =>
        SuccessUseCaseResult<BusArrivalInfoModel>(
          data: BusArrivalInfoModel.fromEntity(
            entity: repositoryResult.data,
          ),
        ),
      FailureRepositoryResult<BusArrivalInfoEntity>() =>
        FailureUseCaseResult<BusArrivalInfoModel>(
          message: repositoryResult.messages?[0],
        )
    };
  }
}
