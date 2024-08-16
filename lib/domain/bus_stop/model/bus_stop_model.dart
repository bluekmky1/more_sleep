class BusStopModel {
  String stopId;
  String stopName;
  int cityCode;
  double lat;
  double long;
  String cityName;

  BusStopModel({
    required this.stopId,
    required this.stopName,
    required this.cityCode,
    required this.cityName,
    required this.lat,
    required this.long,
  });
  factory BusStopModel.fromSupabase(Map<String, dynamic> data) => BusStopModel(
        stopId: data['stopId'] as String,
        stopName: data['stopName'] as String,
        cityCode: data['cityCode'] as int,
        lat: data['lat'] as double,
        long: data['long'] as double,
        cityName: data['cityName'] as String,
      );
}
