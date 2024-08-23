// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../bus_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusEntity _$BusEntityFromJson(Map<String, dynamic> json) => BusEntity(
      response: BusResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusEntityToJson(BusEntity instance) => <String, dynamic>{
      'response': instance.response,
    };

BusResponse _$BusResponseFromJson(Map<String, dynamic> json) => BusResponse(
      header:
          BusResponseHeader.fromJson(json['header'] as Map<String, dynamic>),
      body: BusResponseBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusResponseToJson(BusResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

BusResponseHeader _$BusResponseHeaderFromJson(Map<String, dynamic> json) =>
    BusResponseHeader(
      resultCode: json['resultCode'] as String,
      resultMsg: json['resultMsg'] as String,
    );

Map<String, dynamic> _$BusResponseHeaderToJson(BusResponseHeader instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

BusResponseBody _$BusResponseBodyFromJson(Map<String, dynamic> json) =>
    BusResponseBody(
      items: json['items'] == null
          ? null
          : BusBodyItems.fromJson(json['items'] as Map<String, dynamic>),
      numOfRows: (json['numOfRows'] as num).toInt(),
      pageNo: (json['pageNo'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$BusResponseBodyToJson(BusResponseBody instance) =>
    <String, dynamic>{
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
    };

BusBodyItems _$BusBodyItemsFromJson(Map<String, dynamic> json) => BusBodyItems(
      item: BusBodyItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusBodyItemsToJson(BusBodyItems instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

BusBodyItem _$BusBodyItemFromJson(Map<String, dynamic> json) => BusBodyItem(
      endNodeName: json['endnodenm'] as String,
      routeid: json['nodenm'] as String,
      routeNumber: json['routeno'] as String,
      routeType: json['routetp'] as String,
      startNodeName: json['startnodenm'] as String,
    );

Map<String, dynamic> _$BusBodyItemToJson(BusBodyItem instance) =>
    <String, dynamic>{
      'endnodenm': instance.endNodeName,
      'nodenm': instance.routeid,
      'routeno': instance.routeNumber,
      'routetp': instance.routeType,
      'startnodenm': instance.startNodeName,
    };
