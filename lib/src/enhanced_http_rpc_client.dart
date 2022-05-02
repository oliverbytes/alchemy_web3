import 'dart:async';

import 'package:alchemy/alchemy.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

class EnhancedHttpRpcClient with ConsoleMixin {
  // PROPERTIES
  String url;
  double jsonRPCVersion;
  bool verbose;
  int receiveTimeout;
  int sendTimeout;

  // CONSTRUCTOR
  EnhancedHttpRpcClient({
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
    _dio.options.baseUrl = url;
  }

  Future<Either<EnhancedHTTPError, Response<dynamic>>> request({
    Map<String, dynamic>? parameters,
    String endpoint = '',
    HTTPMethod method = HTTPMethod.post,
  }) async {
    if (url.isEmpty) throw 'Client URL is empty';

    // remove null map property values
    parameters?.removeWhere((key, value) => value == null);

    if (verbose) {
      console.verbose(
        '${method.name.toUpperCase()}: $url/$endpoint, Parameters: $parameters',
      );
    }

    final options = Options(
      method: method.name.toUpperCase(),
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
    );

    try {
      final response = await _dio.request(
        '/$endpoint',
        queryParameters: parameters,
        options: options,
      );

      if (verbose) {
        console.info(
          '${response.statusCode}: ${Uri.decodeFull(response.realUri.toString())}\n${response.data}',
        );
      }

      return Right(response);
    } on DioError catch (e) {
      if (e.response == null) {
        return Left(
          EnhancedHTTPError(
            id: 0,
            jsonrpc: 'local',
            error: RPCError(
              code: 0,
              message: 'Local Error: ${e.type}: ${e.message}',
            ),
          ),
        );
      }

      if (verbose) {
        console.error(
          '${e.response!.statusCode}: ${Uri.decodeFull(e.response!.realUri.toString())}, Data: ${e.response!.data}, Status Message: ${e.response!.statusMessage}',
        );
      }

      return Left(EnhancedHTTPError.fromJson(e.response!.data));
    } catch (e) {
      // different error
      return Left(
        EnhancedHTTPError(
          id: 0,
          jsonrpc: 'unknown',
          error: RPCError(code: 0, message: 'Unknown Error: $e'),
        ),
      );
    }
  }
}

enum HTTPMethod {
  get,
  post,
}
