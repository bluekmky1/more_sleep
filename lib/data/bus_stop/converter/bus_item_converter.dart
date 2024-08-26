import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../entity/bus_entity.dart';

class BusBodyItemConverter extends JsonConverter<BusBodyItem, dynamic> {
  const BusBodyItemConverter();

  @override
  BusBodyItem fromJson(dynamic json) {
    final Map<String, dynamic> decoded = json;

    if (decoded['routeno'].runtimeType == int) {
      return BusBodyItem(
        endNodeName: decoded['endnodenm'] as String,
        routeid: decoded['routeid'] as String,
        routeNumber: (decoded['routeno'] as int).toString(),
        routeType: decoded['routetp'] as String,
        startNodeName: decoded['startnodenm'] as String,
      );
    }

    return BusBodyItem.fromJson(decoded);
  }

  @override
  String toJson(BusBodyItem object) => jsonEncode(object);
}
