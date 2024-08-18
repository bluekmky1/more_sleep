import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../service/supabase/supabase_service.dart';
import 'model/bus_stop_model.dart';

final Provider<GetBusStopListByBoundsUseCase> getBusStopListByBoundsUseCase =
    Provider<GetBusStopListByBoundsUseCase>(
  (ProviderRef<GetBusStopListByBoundsUseCase> ref) =>
      GetBusStopListByBoundsUseCase(
    supabaseClient: ref.watch(supabaseServiceProvider),
  ),
);

class GetBusStopListByBoundsUseCase {
  const GetBusStopListByBoundsUseCase({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<UseCaseResult<List<BusStopModel>>> call({
    required double startLong,
    required double startLat,
    required double endLong,
    required double endLat,
  }) async {
    final PostgrestList response = await _supabaseClient
        .from('bus_stop_info')
        .select()
        .filter('lat', 'gte', startLat)
        .filter('lat', 'lte', endLat)
        .filter('long', 'gte', startLong)
        .filter('long', 'lte', endLong)
        .catchError((Object error) => FailureUseCaseResult<List<BusStopModel>>(
              error: error,
              message: error.toString(),
            ));

    return SuccessUseCaseResult<List<BusStopModel>>(
      data: List<BusStopModel>.generate(
        response.length,
        (int index) => BusStopModel.fromSupabase(
          response[index],
        ),
      ),
    );
  }
}
