import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../entity/bus_entity.dart';

class BusBodyItemsConverter extends JsonConverter<BusBodyItems, dynamic> {
  const BusBodyItemsConverter();

  @override
  BusBodyItems fromJson(dynamic json) {
    if (json == '') {
      return BusBodyItems(item: <BusBodyItem>[]);
    }

    final Map<String, dynamic> decoded = json;

    return BusBodyItems.fromJson(decoded);
  }

  @override
  String toJson(BusBodyItems object) => jsonEncode(object);
}
