import 'package:alchemy/src/enhanced_http_rpc_client.dart';
import 'package:alchemy/src/model/enhanced/enhanced_nft.model.dart';
import 'package:alchemy/src/model/enhanced/enhanced_nft_response.model.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:either_dart/either.dart';

import '../../../alchemy.dart';
import '../../model/enhanced/enhanced_nft_collection.model.dart';
import '../../model/enhanced/enhanced_nft_owners.model.dart';

class NFTAPI with ConsoleMixin {
  late EnhancedHttpRpcClient client;

  void setClient(EnhancedHttpRpcClient client) {
    this.client = client;
  }

  // FUNCTIONS

  Future<Either<EnhancedHTTPError, EnhancedNFTResponse>> getNFTs({
    required String owner,
    String? pageKey,
    List<String> contractAddresses = const [],
    bool withMetadata = true,
    List<String> filters = const [],
  }) async {
    final result = await client.request(
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
      (response) => Right(EnhancedNFTResponse.fromJson(response.data)),
    );
  }

  Future<Either<EnhancedHTTPError, EnhancedNFT>> getNFTMetadata({
    required String contractAddress,
    required String tokenId,
    String? tokenType,
  }) async {
    final result = await client.request(
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
      (response) => Right(EnhancedNFT.fromJson(response.data)),
    );
  }

  Future<Either<EnhancedHTTPError, EnhancedNFTCollection>>
      getNFTsForCollection({
    required String contractAddress,
    bool withMetadata = false,
    String? startToken,
  }) async {
    final result = await client.request(
      endpoint: 'EnhancedNFTCollection',
      method: HTTPMethod.get,
      parameters: {
        'contractAddress': contractAddress,
        'withMetadata': withMetadata,
        'startToken': startToken,
      },
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EnhancedNFTCollection.fromJson(response.data)),
    );
  }

  Future<Either<EnhancedHTTPError, EnhancedNFTOwners>> getOwnersForToken({
    required String contractAddress,
    required String tokenId,
  }) async {
    final result = await client.request(
      endpoint: 'getOwnersForToken',
      method: HTTPMethod.get,
      parameters: {
        'contractAddress': contractAddress,
        'tokenId': tokenId,
      },
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EnhancedNFTOwners.fromJson(response.data)),
    );
  }
}
