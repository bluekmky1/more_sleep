import 'package:equatable/equatable.dart';
import '../../../data/bus_stop/entity/bus_entity.dart';

class BusModel extends Equatable {
  const BusModel({
    required this.busStopId,
    required this.busNumber,
    required this.busType,
  });
  final String busStopId;
  final String busNumber;
  final String busType;

  factory BusModel.fromEntity({
    required BusBodyItem busItem,
  }) =>
      BusModel(
        busStopId: busItem.routeid,
        busNumber: busItem.routeNumber,
        busType: busItem.routeType,
      );

  @override
  List<Object?> get props => <Object?>[
        busStopId,
        busNumber,
        busType,
      ];
}
