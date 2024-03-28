import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:either_dart/either.dart';

/// class to make custom api calls
/// useful in case when the alchemy library is not providing the required api
class CustomApi {
  late RpcWsClient wsClient;
  late RpcHttpClient httpClient;

  void setWsClient(RpcWsClient rpcClient) {
    wsClient = rpcClient;
  }

  void setHttpClient(RpcHttpClient httpClient) {
    httpClient = httpClient;
  }

  Future<Either<RPCErrorData, dynamic>> wsRequest({
    required String method,
    required List<dynamic> params,
  }) async {
    final result = await wsClient.request(method: method, params: params);

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RpcResponse, dynamic>> httpRequest({
    required String endpoint,
    required Map<String, dynamic> params,
    required HTTPMethod httpMethod,
  }) async {
    final result = await httpClient.request(
      endpoint: endpoint,
      method: httpMethod,
      parameters: params,
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
