import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_option/either_option.dart';

import '../model/error.model.dart';

class AlchemyClient {
  // PROPERTIES
  String apiKey;
  String scheme;
  String subDomain;
  String host;
  int apiVersion;
  double jsonRPCVersion;
  bool verbose;
  int receiveTimeout;
  int sendTimeout;

  // CONSTRUCTOR
  AlchemyClient({
    this.apiKey = '',
    this.scheme = 'https',
    this.subDomain = 'polygon-mumbai.g',
    this.host = 'alchemyapi.io',
    this.apiVersion = 2,
    this.jsonRPCVersion = 2.0,
    this.verbose = false,
    this.receiveTimeout = 20000,
    this.sendTimeout = 20000,
  });

  // GETTERS
  String get baseUrl => '$scheme://$subDomain.$host';
  String get apiUrl => '$baseUrl/v$apiVersion/$apiKey';

  // VARIABLES
  final _dio = Dio();

  // FUNCTIONS
  void init({
    required String apiKey,
    String? scheme,
    String? subDomain,
    String? host,
    int? version,
    double? jsonRPCVersion,
    bool? verbose,
    int? receiveTimeout,
    int? sendTimeout,
  }) {
    this.apiKey = apiKey;
    this.scheme = scheme ?? this.scheme;
    this.subDomain = subDomain ?? this.subDomain;
    this.host = host ?? this.host;
    this.apiVersion = version ?? this.apiVersion;
    this.jsonRPCVersion = jsonRPCVersion ?? this.jsonRPCVersion;
    this.verbose = verbose ?? this.verbose;
    this.sendTimeout = sendTimeout ?? this.sendTimeout;
    this.receiveTimeout = receiveTimeout ?? this.receiveTimeout;
  }

  Future<Either<AlchemyError, Response<dynamic>>> request(
    Map<String, dynamic> data, {
    HTTPMethod method = HTTPMethod.post,
  }) async {
    if (apiKey.isEmpty)
      throw 'Missing Alchemy API Key! Did you forget to initialize with setClient()?';

    if (verbose) {
      print('${method.name.toUpperCase()}: $apiUrl, Data: $data');
    }

    try {
      data.addAll({'jsonrpc': jsonRPCVersion.toString()});

      final options = Options(
        method: method.name.toUpperCase(),
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      );

      Response<dynamic>? response;

      response = await _dio.request(
        apiUrl,
        data: data,
        options: options,
      );

      if (verbose) {
        print(
            '${response.statusCode}: ${Uri.decodeFull(response.realUri.toString())}');
      }

      return Right(response);
    } on DioError catch (e) {
      if (e.response == null) {
        return Left(
          AlchemyError(
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
        print(
            '${e.response!.statusCode}: ${Uri.decodeFull(e.response!.realUri.toString())}, Data: ${e.response!.data}, Status Message: ${e.response!.statusMessage}');
      }

      return Left(AlchemyError.fromJson(e.response!.data));
    } catch (e) {
      // different error
      return Left(
        AlchemyError(
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
