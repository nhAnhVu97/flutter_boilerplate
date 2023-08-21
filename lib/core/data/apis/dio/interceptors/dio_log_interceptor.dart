// ignore_for_file: strict_raw_type, avoid_returning_this

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_project_boilerplate/core/shared/utils/colorize.dart';

class DioLogInterceptor implements Interceptor {
  DioLogInterceptor({
    Styles? requestStyle,
    Styles? responseStyle,
    Styles? errorStyle,
    bool logRequestData = true,
    bool logRequestHeaders = false,
    bool logResponseHeaders = false,
    bool logRequestTimeout = true,
    bool logResponseBody = true,
    void Function(String log)? logger,
  })  : _jsonEncoder = const JsonEncoder.withIndent('  '),
        _requestStyle = requestStyle ?? _defaultRequestStyle,
        _responseStyle = responseStyle ?? _defaultResponseStyle,
        _errorStyle = errorStyle ?? _defaultErrorStyle,
        _logRequestHeaders = logRequestHeaders,
        _logResponseHeaders = logResponseHeaders,
        _logResponseBody = logResponseBody,
        _logRequestData = logRequestData,
        _logRequestTimeout = logRequestTimeout,
        _logger = logger ?? log;

  static const Styles _defaultRequestStyle = Styles.request;
  static const Styles _defaultResponseStyle = Styles.green;
  static const Styles _defaultErrorStyle = Styles.red;

  late final JsonEncoder _jsonEncoder;
  late final bool _logRequestData;
  late final bool _logRequestHeaders;
  late final bool _logResponseHeaders;
  late final bool _logResponseBody;
  late final bool _logRequestTimeout;
  late final void Function(String log) _logger;

  late final Styles _requestStyle;
  late final Styles _responseStyle;
  late final Styles _errorStyle;

  void _log({required String key, required String value, Styles? style}) {
    final coloredMessage = Colorize('$key$value').apply(
      style ?? Styles.reset,
    );
    _logger('$coloredMessage');
  }

  void _logJson({
    required String key,
    dynamic value,
    Styles? style,
    bool isResponse = false,
  }) {
    final isFormData = value.runtimeType == FormData;
    final isValueNull = value == null;

    final encodedJson = _jsonEncoder.convert(
      isFormData ? Map.fromEntries((value as FormData).fields) : value,
    );
    _log(
      key: isResponse
          ? key
          : '${isFormData ? '[formData.fields]' : !isValueNull ? '[Json]' : ''} $key',
      value: encodedJson,
      style: style,
    );

    if (isFormData && !isResponse) {
      final files = (value as FormData).files.map((e) => e.value.filename ?? 'Null or Empty filename').toList();
      if (files.isNotEmpty) {
        final encodedJson = _jsonEncoder.convert(files);
        _log(
          key: '[formData.files] Request Body:\n',
          value: encodedJson,
          style: style,
        );
      }
    }
  }

  void _logHeaders({required Map headers, Styles? style}) {
    _log(key: 'Headers:', value: '', style: style);
    headers.forEach((key, value) {
      _log(
        key: '\t$key: ',
        value: (value is List && value.length == 1) ? value.first.toString() : value.toString(),
        style: style,
      );
    });
  }

  void _logNewLine() => _log(key: '', value: '');

  void _logRequest(RequestOptions options, {Styles? style}) {
    if (!_logRequestData) {
      return;
    }
    _log(key: '[Request] | ${options.method}', value: '', style: _requestStyle);
    _log(key: 'Uri: ', value: options.uri.toString(), style: _requestStyle);

    if (_logRequestTimeout) {
      _log(
        key: 'Response Type: ',
        value: options.responseType.toString(),
        style: style,
      );
      _log(
        key: 'Follow Redirects: ',
        value: options.followRedirects.toString(),
        style: style,
      );
      _log(
        key: 'Connection Timeout: ',
        value: options.connectTimeout.toString(),
        style: style,
      );
      _log(
        key: 'Send Timeout: ',
        value: options.sendTimeout.toString(),
        style: style,
      );
      _log(
        key: 'Receive Timeout: ',
        value: options.receiveTimeout.toString(),
        style: style,
      );
      _log(
        key: 'Receive Data When Status Error: ',
        value: options.receiveDataWhenStatusError.toString(),
        style: style,
      );
      _log(key: 'Extra: ', value: options.extra.toString(), style: style);
    }

    if (_logRequestHeaders) {
      _logHeaders(headers: options.headers, style: style);
    }
    if (options.data != null) {
      _logJson(key: 'Request Body:\n', value: options.data, style: style);
    }
  }

  void _logResponse(Response response, {Styles? style, bool error = false}) {
    if (!error) {
      _log(key: '[Response] | ${response.statusCode} | ${response.requestOptions.method}', value: '', style: style);
    }
    _log(key: 'Uri: ', value: response.realUri.toString(), style: style);
    if (_logResponseHeaders) {
      _logHeaders(headers: response.headers.map, style: style);
    }
    if (_logResponseBody) {
      _logJson(
        key: 'Response Body:\n',
        value: response.data,
        style: style,
        isResponse: true,
      );
    }
  }

  void _logError(DioException err, {Styles? style}) {
    _log(key: '[Error] -> ', value: '[${err.type}]: ${err.message}', style: style);
    _log(key: '[Response] | ', value: err.requestOptions.method, style: style);
  }

  Future<void> _delay() async => Future.delayed(const Duration(milliseconds: 200));

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logError(err, style: _errorStyle);
    if (err.response != null) {
      _logResponse(err.response!, error: true, style: _errorStyle);
    }
    _logNewLine();

    _delay();

    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logRequest(options, style: _requestStyle);
    _logNewLine();

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response, style: _responseStyle);
    _logNewLine();

    handler.next(response);
  }
}
