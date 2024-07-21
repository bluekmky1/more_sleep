import 'package:json_annotation/json_annotation.dart';

part 'generated/bus_stop_entity.g.dart';

@JsonSerializable()
class BusStopEntity {
  BusStopEntity({
    required this.response,
  });
  final BusStopResponse response;

  factory BusStopEntity.fromJson(Map<String, dynamic> json) =>
      _$BusStopEntityFromJson(json);
}

@JsonSerializable()
class BusStopResponse {
  BusStopResponse({
    required this.header,
    required this.body,
  });
  final BusStopResponseHeader header;
  final BusStopResponseBody body;

  factory BusStopResponse.fromJson(Map<String, dynamic> json) =>
      _$BusStopResponseFromJson(json);
}

@JsonSerializable()
class BusStopResponseHeader {
  BusStopResponseHeader({required this.resultCode, required this.resultMsg});
  final String resultCode;
  final String resultMsg;

  factory BusStopResponseHeader.fromJson(Map<String, dynamic> json) =>
      _$BusStopResponseHeaderFromJson(json);
}

@JsonSerializable()
class BusStopResponseBody {
  BusStopResponseBody({
    required this.items,
    required this.numOfRows,
    required this.pageNo,
    required this.totalCount,
  });

  final BusStopBodyItems? items;
  final int numOfRows;
  final int pageNo;
  final int totalCount;

  factory BusStopResponseBody.fromJson(Map<String, dynamic> json) =>
      _$BusStopResponseBodyFromJson(json);
}

@JsonSerializable()
class BusStopBodyItems {
  BusStopBodyItems({
    required this.item,
  });
  final BusStopBodyItem item;

  factory BusStopBodyItems.fromJson(Map<String, dynamic> json) =>
      _$BusStopBodyItemsFromJson(json);
}

@JsonSerializable()
class BusStopBodyItem {
  BusStopBodyItem({
    required this.nodeId,
    required this.nodeName,
    required this.nodeNumber,
  });

  @JsonKey(name: 'nodeid')
  final String nodeId;
  @JsonKey(name: 'nodenm')
  final String nodeName;
  @JsonKey(name: 'nodeno')
  final String nodeNumber;

  factory BusStopBodyItem.fromJson(Map<String, dynamic> json) =>
      _$BusStopBodyItemFromJson(json);
}
