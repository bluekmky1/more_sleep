import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../entity/bus_arrival_info_entity.dart';

class BusArrivalBodyItemsConverter
    extends JsonConverter<BusArrivalBodyItems?, String> {
  const BusArrivalBodyItemsConverter();

  @override
  BusArrivalBodyItems? fromJson(String json) {
    if (json == '') {
      return null;
    }

    return BusArrivalBodyItems.fromJson(jsonDecode(json));
  }

  @override
  String toJson(BusArrivalBodyItems? object) => jsonEncode(object);
}
