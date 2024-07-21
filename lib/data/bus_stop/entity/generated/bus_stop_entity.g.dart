// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../bus_stop_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusStopEntity _$BusStopEntityFromJson(Map<String, dynamic> json) =>
    BusStopEntity(
      response:
          BusStopResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusStopEntityToJson(BusStopEntity instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

BusStopResponse _$BusStopResponseFromJson(Map<String, dynamic> json) =>
    BusStopResponse(
      header: BusStopResponseHeader.fromJson(
          json['header'] as Map<String, dynamic>),
      body: BusStopResponseBody.fromJson(json['body'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusStopResponseToJson(BusStopResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
    };

BusStopResponseHeader _$BusStopResponseHeaderFromJson(
        Map<String, dynamic> json) =>
    BusStopResponseHeader(
      resultCode: json['resultCode'] as String,
      resultMsg: json['resultMsg'] as String,
    );

Map<String, dynamic> _$BusStopResponseHeaderToJson(
        BusStopResponseHeader instance) =>
    <String, dynamic>{
      'resultCode': instance.resultCode,
      'resultMsg': instance.resultMsg,
    };

BusStopResponseBody _$BusStopResponseBodyFromJson(Map<String, dynamic> json) =>
    BusStopResponseBody(
      items: json['items'] == null
          ? null
          : BusStopBodyItems.fromJson(json['items'] as Map<String, dynamic>),
      numOfRows: (json['numOfRows'] as num).toInt(),
      pageNo: (json['pageNo'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$BusStopResponseBodyToJson(
        BusStopResponseBody instance) =>
    <String, dynamic>{
      'items': instance.items,
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
    };

BusStopBodyItems _$BusStopBodyItemsFromJson(Map<String, dynamic> json) =>
    BusStopBodyItems(
      item: BusStopBodyItem.fromJson(json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusStopBodyItemsToJson(BusStopBodyItems instance) =>
    <String, dynamic>{
      'item': instance.item,
    };

BusStopBodyItem _$BusStopBodyItemFromJson(Map<String, dynamic> json) =>
    BusStopBodyItem(
      nodeId: json['nodeid'] as String,
      nodeName: json['nodenm'] as String,
      nodeNumber: json['nodeno'] as String,
    );

Map<String, dynamic> _$BusStopBodyItemToJson(BusStopBodyItem instance) =>
    <String, dynamic>{
      'nodeid': instance.nodeId,
      'nodenm': instance.nodeName,
      'nodeno': instance.nodeNumber,
    };
