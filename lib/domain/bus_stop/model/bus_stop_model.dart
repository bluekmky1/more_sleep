import 'package:equatable/equatable.dart';

class BusStopModel extends Equatable {
  final String stopId;
  final String stopName;
  final int cityCode;
  final double lat;
  final double long;
  final String cityName;

  const BusStopModel({
    required this.stopId,
    required this.stopName,
    required this.cityCode,
    required this.cityName,
    required this.lat,
    required this.long,
  });
  const BusStopModel.init()
      : stopId = '',
        stopName = '',
        cityCode = 0,
        cityName = '',
        lat = 0,
        long = 0;

  factory BusStopModel.fromSupabase(Map<String, dynamic> data) => BusStopModel(
        stopId: data['stopId'] as String,
        stopName: data['stopName'] as String,
        cityCode: data['cityCode'] as int,
        lat: data['lat'] as double,
        long: data['long'] as double,
        cityName: data['cityName'] as String,
      );

  @override
  List<Object?> get props => <Object?>[
        stopId,
        stopName,
        cityCode,
        lat,
        long,
        cityName,
      ];
}
