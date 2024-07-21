// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../bus_location_remote_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BusLocationRemoteDataSource implements BusLocationRemoteDataSource {
  _BusLocationRemoteDataSource(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<void> getBusLocationList({
    required String pageNumber,
    required String numberOfRows,
    required String dataType,
    required String routeId,
    required String cityCode,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageNo': pageNumber,
      r'numOfRows': numberOfRows,
      r'_type': dataType,
      r'routeId': routeId,
      r'cityCode': cityCode,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/BusLcInfoInqireService/getRouteAcctoBusLcList',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<void> getApproachingBusLocation({
    required String pageNumber,
    required String numberOfRows,
    required String dataType,
    required String routeId,
    required String nodeId,
    required String cityCode,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pageNo': pageNumber,
      r'numOfRows': numberOfRows,
      r'_type': dataType,
      r'routeId': routeId,
      r'nodeId': nodeId,
      r'cityCode': cityCode,
    };
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/BusLcInfoInqireService/getRouteAcctoSpcifySttnAccesBusLcInfo',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
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
