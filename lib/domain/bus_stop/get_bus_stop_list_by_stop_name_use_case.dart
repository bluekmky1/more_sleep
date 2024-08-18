import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/common/use_case/use_case_result.dart';
import '../../service/supabase/supabase_service.dart';
import 'model/bus_stop_model.dart';

final Provider<GetBusStopListByStopNameUseCase>
    getBusStopListByStopNameUseCaseProvider =
    Provider<GetBusStopListByStopNameUseCase>(
  (ProviderRef<GetBusStopListByStopNameUseCase> ref) =>
      GetBusStopListByStopNameUseCase(
    supabaseClient: ref.watch(supabaseServiceProvider),
  ),
);

class GetBusStopListByStopNameUseCase {
  const GetBusStopListByStopNameUseCase({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  Future<UseCaseResult<List<BusStopModel>>> call({
    required String keyword,
  }) async {
    final PostgrestList response = await _supabaseClient
        .from('bus_stop_info')
        .select()
        .ilike('stopName', '%$keyword%')
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
