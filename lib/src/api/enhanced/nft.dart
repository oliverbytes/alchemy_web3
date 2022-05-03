import 'package:alchemy/src/client/rpc_http_client.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:either_dart/either.dart';

import '../../../alchemy.dart';

class EnhancedNFTAPI with ConsoleMixin {
  late RpcHttpClient httpClient;

  void setClient(RpcHttpClient client) {
    httpClient = client;
  }

  // FUNCTIONS

  Future<Either<RpcResponse, EnhancedNFTResponse>> getNFTs({
    required String owner,
    String? pageKey,
    List<String> contractAddresses = const [],
    bool withMetadata = true,
    List<String> filters = const [],
  }) async {
    final result = await httpClient.request(
      endpoint: 'getNFTs',
      method: HTTPMethod.get,
      parameters: {
        'owner': owner,
        'pageKey': pageKey,
        'contractAddresses': contractAddresses,
        'withMetadata': withMetadata,
        'filters': filters,
      },
    );

    return result.fold(
      (error) => Left(error),
      (json) => Right(EnhancedNFTResponse.fromJson(json)),
    );
  }

  Future<Either<RpcResponse, EnhancedNFT>> getNFTMetadata({
    required String contractAddress,
    required String tokenId,
    String? tokenType,
  }) async {
    final result = await httpClient.request(
      endpoint: 'getNFTMetadata',
      method: HTTPMethod.get,
      parameters: {
        'contractAddress': contractAddress,
        'tokenId': tokenId,
        'tokenType': tokenType,
      },
    );

    return result.fold(
      (error) => Left(error),
      (json) => Right(EnhancedNFT.fromJson(json)),
    );
  }

  Future<Either<RpcResponse, EnhancedNFTCollection>> getNFTsForCollection({
    required String contractAddress,
    bool withMetadata = false,
    String? startToken,
  }) async {
    final result = await httpClient.request(
      endpoint: 'getNFTsForCollection',
      method: HTTPMethod.get,
      parameters: {
        'contractAddress': contractAddress,
        'withMetadata': withMetadata,
        'startToken': startToken,
      },
    );

    return result.fold(
      (error) => Left(error),
      (json) => Right(EnhancedNFTCollection.fromJson(json)),
    );
  }

  Future<Either<RpcResponse, EnhancedNFTOwners>> getOwnersForToken({
    required String contractAddress,
    required String tokenId,
  }) async {
    final result = await httpClient.request(
      endpoint: 'getOwnersForToken',
      method: HTTPMethod.get,
      parameters: {
        'contractAddress': contractAddress,
        'tokenId': tokenId,
      },
    );

    return result.fold(
      (error) => Left(error),
      (json) => Right(EnhancedNFTOwners.fromJson(json)),
    );
  }
}
