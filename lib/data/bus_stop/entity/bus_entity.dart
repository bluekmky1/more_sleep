import 'package:json_annotation/json_annotation.dart';

import '../converter/bus_item_converter.dart';
import '../converter/bus_items_converter.dart';

part 'generated/bus_entity.g.dart';

@JsonSerializable()
class BusEntity {
  BusEntity({
    required this.response,
  });
  final BusResponse response;

  factory BusEntity.fromJson(Map<String, dynamic> json) =>
      _$BusEntityFromJson(json);
}

@JsonSerializable()
class BusResponse {
  BusResponse({
    required this.header,
    required this.body,
  });
  final BusResponseHeader header;
  final BusResponseBody body;

  factory BusResponse.fromJson(Map<String, dynamic> json) =>
      _$BusResponseFromJson(json);
}

@JsonSerializable()
class BusResponseHeader {
  BusResponseHeader({required this.resultCode, required this.resultMsg});
  final String resultCode;
  final String resultMsg;

  factory BusResponseHeader.fromJson(Map<String, dynamic> json) =>
      _$BusResponseHeaderFromJson(json);
}

@JsonSerializable()
class BusResponseBody {
  BusResponseBody({
    required this.items,
    required this.numOfRows,
    required this.pageNo,
    required this.totalCount,
  });

  @BusBodyItemsConverter()
  final BusBodyItems items;
  final int numOfRows;
  final int pageNo;
  final int totalCount;

  factory BusResponseBody.fromJson(Map<String, dynamic> json) =>
      _$BusResponseBodyFromJson(json);
}

@JsonSerializable()
class BusBodyItems {
  BusBodyItems({
    required this.item,
  });

  @BusBodyItemConverter()
  final List<BusBodyItem> item;

  factory BusBodyItems.fromJson(Map<String, dynamic> json) =>
      _$BusBodyItemsFromJson(json);
}

@JsonSerializable()
class BusBodyItem {
  BusBodyItem({
    required this.endNodeName,
    required this.routeid,
    required this.routeNumber,
    required this.routeType,
    required this.startNodeName,
  });

  @JsonKey(name: 'endnodenm')
  final String endNodeName;
  @JsonKey(name: 'routeid')
  final String routeid;
  @JsonKey(name: 'routeno')
  final String routeNumber;
  @JsonKey(name: 'routetp')
  final String routeType;
  @JsonKey(name: 'startnodenm')
  final String startNodeName;

  factory BusBodyItem.fromJson(Map<String, dynamic> json) =>
      _$BusBodyItemFromJson(json);
}
