import 'dart:async';
import 'dart:io';

import 'package:alchemy/alchemy.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'model/error.model.dart';

enum WsStatus { uninitialized, connecting, running, stopped }

class EthereumWsRpcClient with ConsoleMixin implements Client {
  // PROPERTIES
  String url;
  bool verbose;

  // CONSTRUCTOR
  EthereumWsRpcClient({
    this.url = '',
    this.verbose = false,
  }) {
    wsStatus = WsStatus.uninitialized;
  }

  // GETTERS

  // VARIABLES
  Client? wsClient;
  WsStatus? wsStatus;
  bool? lastRestarted;
  var timeOutDuration = Duration(seconds: 5);

  // FUNCTIONS
  Future<void> init({
    required String url,
    Duration timeOutDuration = const Duration(seconds: 5),
    bool verbose = false,
  }) async {
    this.url = url;
    this.verbose = verbose;
    this.timeOutDuration = timeOutDuration;

    wsStatus = WsStatus.connecting;
    console.info('Socket Connecting...');

    try {
      final socket = await WebSocket.connect(url).timeout(timeOutDuration);
      wsStatus = WsStatus.running;
      console.info('Socket Connected');

      wsClient = Client(IOWebSocketChannel(socket).cast<String>());
      wsClient!.listen().then((_) => restart);
    } catch (e) {
      console.warning('$e');
    }
  }

  Future<Either<RPCErrorData, dynamic>> request({
    required String method,
    required List<dynamic> params,
  }) async {
    if (url.isEmpty) throw 'Client URL is empty';
    if (wsStatus != WsStatus.running) await restart();
    if (verbose) console.verbose('Requesting... $url -> $method: $params');

    // STOP SOCKET
    if (isClosed) {
      stop();

      return Left(RPCErrorData(
        code: 0,
        message: 'No Internet Connection',
      ));
    }

    try {
      final response = await sendRequest(method, params);
      if (verbose) console.info('Response: $response');

      if (response == null) {
        //
      }

      return Right(response);
    } on DioError catch (e) {
      if (e.response == null) {
        return Left(
          RPCErrorData(
            code: 0,
            message: 'Local Error: ${e.type}: ${e.message}',
          ),
        );
      }

      return Left(RPCErrorData.fromJson(e.response!.data));
    } catch (e) {
      // different error
      return Left(RPCErrorData(
        code: 0,
        message: 'Unknown Error: $e',
      ));
    }
  }

  Future<void> restart() async {
    console.info('Socket Restarting...');
    await init(url: url, verbose: verbose);
    console.info('Socket Restarted');
  }

  Future<void> stop() async {
    if (wsStatus != WsStatus.running || wsClient == null || isClosed) return;
    console.info('Socket Stopping...');
    await wsClient!.close();
    wsStatus = WsStatus.stopped;
    console.info('Socket Stopped');
  }

  @override
  Future sendRequest(String method, [parameters]) {
    return wsClient!.sendRequest(method, parameters).timeout(timeOutDuration);
  }

  @override
  bool get isClosed {
    return wsClient?.isClosed ?? false;
  }

  @override
  Future close() {
    throw UnimplementedError();
  }

  @override
  Future get done => throw UnimplementedError();

  @override
  Future listen() {
    throw UnimplementedError();
  }

  @override
  void sendNotification(String method, [parameters]) {}

  @override
  void withBatch(Function() callback) {}
}
