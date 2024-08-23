// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../bus_stop_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BusStopRemoteDataSource implements BusStopRemoteDataSource {
  _BusStopRemoteDataSource(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BusStopEntity> getBusStopList({
    required String serviceKey,
    required String pageNumber,
    required String numberOfRows,
    required String dataType,
    required String cityCode,
    required String nodeName,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'serviceKey': serviceKey,
      r'pageNo': pageNumber,
      r'numOfRows': numberOfRows,
      r'_type': dataType,
      r'cityCode': cityCode,
      r'nodeNm': nodeName,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BusStopEntity>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'BusSttnInfoInqireService/getSttnNoList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BusStopEntity.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BusEntity> getTransitBusByBusStopId({
    required String serviceKey,
    required String pageNumber,
    required String numberOfRows,
    required String dataType,
    required String cityCode,
    required String nodeId,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'serviceKey': serviceKey,
      r'pageNo': pageNumber,
      r'numOfRows': numberOfRows,
      r'_type': dataType,
      r'cityCode': cityCode,
      r'nodeId': nodeId,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BusEntity>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'BusSttnInfoInqireService/getSttnThrghRouteList',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BusEntity.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
