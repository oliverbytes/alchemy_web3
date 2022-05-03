import 'dart:async';
import 'dart:convert';

import 'package:alchemy/alchemy.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class RpcHttpClient with ConsoleMixin {
  // PROPERTIES
  String url;
  double jsonRPCVersion;
  bool verbose;
  int receiveTimeout;
  int sendTimeout;

  // CONSTRUCTOR
  RpcHttpClient({
    this.url = '',
    this.jsonRPCVersion = 2.0,
    this.receiveTimeout = 10000,
    this.sendTimeout = 10000,
    this.verbose = false,
  });

  // GETTERS

  // VARIABLES
  final _dio = Dio();

  // FUNCTIONS
  void init({
    required String url,
    double? jsonRPCVersion,
    int? receiveTimeout,
    int? sendTimeout,
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

  Future<Either<RpcResponse, Map<String, dynamic>>> request({
    Map<String, dynamic>? parameters,
    String endpoint = '',
    HTTPMethod method = HTTPMethod.post,
  }) async {
    if (url.isEmpty) throw 'Client URL is empty';

    // remove null map property values
    parameters?.removeWhere((key, value) => value == null);

    if (verbose) {
      console.verbose(
        'Requesting... ${method.name.toUpperCase()}: $url/$endpoint\n$parameters',
      );
    }

    Response<String> response;

    try {
      response = await _dio.request<String>(
        '/$endpoint',
        queryParameters: parameters,
        options: Options(
          method: method.name.toUpperCase(),
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
          responseType: ResponseType.plain,
        ),
      );
    } on DioError catch (e) {
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
      console.info(
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
