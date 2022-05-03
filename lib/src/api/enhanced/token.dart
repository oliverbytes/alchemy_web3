import 'package:alchemy_web3/src/client/rpc_ws_client.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:either_dart/either.dart';

import '../../../alchemy.dart';

class EnhancedTokenAPI with ConsoleMixin {
  late RpcWsClient wsClient;

  void setClient(RpcWsClient client) {
    wsClient = client;
  }

  // FUNCTIONS

  Future<Either<RPCErrorData, String>> getTokenAllowance({
    required String contract,
    required String owner,
    required String spender,
  }) async {
    final result = await wsClient.request(
      method: 'alchemy_getTokenAllowance',
      params: [
        {
          "contract": contract,
          "owner": owner,
          "spender": spender,
        }
      ],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, EnhancedTokenBalances>> getTokenBalances({
    required String address,
    List<String> contractAddresses = const [],
  }) async {
    final result = await wsClient.request(
      method: 'alchemy_getTokenBalances',
      params: [
        address,
        contractAddresses.isNotEmpty ? contractAddresses : 'DEFAULT_TOKENS',
      ],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EnhancedTokenBalances.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, EnhancedTokenMetadata>> getTokenMetadata({
    required String address,
  }) async {
    final result = await wsClient.request(
      method: 'alchemy_getTokenMetadata',
      params: [address],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EnhancedTokenMetadata.fromJson(response)),
    );
  }
}
