import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../service/supabase/supabase_service.dart';
import 'model/bus_stop_model.dart';

final Provider<GetBusStopByStopIdUseCase> getBusStopByStopIdUseCaseProvider =
    Provider<GetBusStopByStopIdUseCase>(
  (ProviderRef<GetBusStopByStopIdUseCase> ref) => GetBusStopByStopIdUseCase(
    supabaseClient: ref.watch(supabaseServiceProvider),
  ),
);

class GetBusStopByStopIdUseCase {
  const GetBusStopByStopIdUseCase({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<UseCaseResult<BusStopModel>> call({
    required String stopId,
  }) async {
    final PostgrestList response = await _supabaseClient
        .from('bus_stop_info')
        .select()
        .eq('stopId', stopId)
        .catchError((Object error) => FailureUseCaseResult<BusStopModel>(
              error: error,
              message: error.toString(),
            ));

    if (response.isEmpty) {
      return const FailureUseCaseResult<BusStopModel>(
        message: 'not found',
      );
    }

    return SuccessUseCaseResult<BusStopModel>(
      data: BusStopModel.fromSupabase(response.first),
    );
  }
}
