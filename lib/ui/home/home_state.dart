import 'package:equatable/equatable.dart';
import '../../../core/loading_status.dart';

class HomeState extends Equatable {
  final LoadingStatus loadingStatus;

  const HomeState({
    required this.loadingStatus,
  });

  const HomeState.init() : loadingStatus = LoadingStatus.none;

  HomeState copyWith({
    LoadingStatus? loadingStatus,
  }) =>
      HomeState(
        loadingStatus: loadingStatus ?? this.loadingStatus,
      );

  @override
  List<Object> get props => <Object>[
        loadingStatus,
      ];
}
