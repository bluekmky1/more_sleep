class BusStopModel {
  String stopId;
  String stopName;
  int cityCode;
  String cityName;
  DateTime dataCollectionDate;

  BusStopModel({
    required this.stopId,
    required this.stopName,
    required this.cityCode,
    required this.cityName,
    required this.dataCollectionDate,
  });
  factory BusStopModel.fromSupabase(Map<String, dynamic> data) => BusStopModel(
        stopId: data['stopId'] as String,
        stopName: data['stopName'] as String,
        cityCode: data['cityCode'] as int,
        cityName: data['cityName'] as String,
        dataCollectionDate: DateTime.parse(data['dataCollectionDate']),
      );
}
