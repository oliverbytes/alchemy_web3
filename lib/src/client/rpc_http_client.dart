import 'dart:async';
import 'dart:convert';

import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class RpcHttpClient with AlchemyConsoleMixin {
  // PROPERTIES
  String url;
  double jsonRPCVersion;
  bool verbose;
  Duration receiveTimeout;
  Duration sendTimeout;

  // CONSTRUCTOR
  RpcHttpClient({
    this.url = '',
    this.jsonRPCVersion = 2.0,
    this.receiveTimeout = const Duration(seconds: 10),
    this.sendTimeout = const Duration(seconds: 10),
    this.verbose = false,
  });

  static int _requestId = 0;

  // GETTERS

  // VARIABLES
  final _dio = Dio();

  // FUNCTIONS
  void init({
    required String url,
    double? jsonRPCVersion,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    bool? verbose,
  }) {
    this.url = url;
    this.jsonRPCVersion = jsonRPCVersion ?? this.jsonRPCVersion;
    this.sendTimeout = sendTimeout ?? this.sendTimeout;
    this.receiveTimeout = receiveTimeout ?? this.receiveTimeout;
    this.verbose = verbose ?? this.verbose;
    // set base url
    _dio.options.baseUrl = url;
  }

  Future<Either<RpcResponse, dynamic>> request({
    Map<String, dynamic>? queryParameters,
    String endpoint = '',
    HTTPMethod method = HTTPMethod.post,
    List<dynamic> bodyParameters = const [],
  }) async {
    if (url.isEmpty) throw 'Client URL is empty';

    var updatedParametersMap = Map<String, dynamic>.from(queryParameters ?? {});
    // remove null map property values
    updatedParametersMap.removeWhere((key, value) => value == null);

    // convert the arrays so it works in the query parameters
    if (updatedParametersMap['filters'] != null && queryParameters?['filters'] is List) {
      updatedParametersMap['filters[]'] = List.filled(updatedParametersMap['filters'].length, '');
      for (int i = 0; i < updatedParametersMap['filters'].length; i++) {
        updatedParametersMap['filters[]'][i] = updatedParametersMap['filters'][i]?.toString().split('.').last;
      }
    }
    updatedParametersMap.remove('filters');

    var bodyData = {
      'method': endpoint,
      'params': bodyParameters,
      'jsonrpc': jsonRPCVersion.toString(),
      'id': _requestId = _requestId + 1,
    };

    if (verbose) {
      console.trace(
        'Requesting... ${method.name.toUpperCase()}: $url, method: $endpoint, queryParameters: \n$updatedParametersMap, bodyParameters: $bodyParameters}',
      );
    }

    Response<String> response;

    try {
      if (method == HTTPMethod.post) {
        response = await _dio.post<String>(
          url,
          queryParameters: updatedParametersMap,
          data: jsonEncode(bodyData),
          options: Options(
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
            responseType: ResponseType.plain,
          ),
        );
      } else {
        response = await _dio.get<String>(
          '/$endpoint',
          queryParameters: updatedParametersMap,
          options: Options(
            method: method.name.toUpperCase(),
            receiveTimeout: receiveTimeout,
            sendTimeout: sendTimeout,
            responseType: ResponseType.plain,
          ),
        );
      }
    } on DioException catch (e) {
      if (verbose) {
        console.error(
          '${e.type}! ${e.response?.statusCode} : ${e.response?.realUri}\n${e.response?.data}',
        );
      }

      return Left(
        RpcResponse(
          id: 0,
          jsonrpc: jsonRPCVersion.toString(),
          error: RPCError(
            code: e.response?.statusCode ?? 0,
            message: e.response?.data ?? e.message,
          ),
        ),
      );
    }

    if (verbose) {
      console.debug(
        '${response.statusCode} : ${response.realUri}\n${response.data}',
      );
    }

    return Right(jsonDecode(response.data!));
  }
}

enum HTTPMethod {
  get,
  post,
}
