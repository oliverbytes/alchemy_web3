import 'package:alchemy/src/model/eth/eth_block.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction_receipt.model.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:either_dart/either.dart';

import '../../alchemy.dart';
import '../model/response.model.dart';
import 'alchemy_client.dart';

class EthAPI with ConsoleMixin {
  late AlchemyClient client;

  void setClient(AlchemyClient client) {
    this.client = client;
  }

  // FUNCTIONS

  Future<Either<AlchemyError, AlchemyResponse<String>>> blockNumber() async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_blockNumber',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthBlockResult>>> getBlockByHash({
    required String hash,
    bool asObject = true, // return as object or hash only
  }) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getBlockByHash',
      'params': [hash, asObject],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthBlockResult>>>
      getBlockByNumber({
    required String block,
    bool asObject = true, // return as object or hash only
  }) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getBlockByNumber',
      'params': [block, asObject],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthTransaction>>>
      getTransactionByHash({required String hash}) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getTransactionByHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthTransaction>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> getTransactionCount({
    required String address,
    String block = 'latest',
  }) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getTransactionCount',
      'params': [address, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthTransactionReceipt>>>
      getTransactionReceipt({required String hash}) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getTransactionReceipt',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthTransactionReceipt>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>>
      getBlockTransactionCountByHash({required String hash}) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getBlockTransactionCountByHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>>
      getBlockTransactionCountByNumber({required String block}) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getBlockTransactionCountByNumber',
      'params': [block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>>
      getTransactionByBlockNumberAndIndex({
    required String block,
    required String index,
  }) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_getTransactionByBlockNumberAndIndex',
      'params': [block, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> getRootHash({
    required int from,
    required int to,
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getRootHash',
      'params': [from, to],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<List<String>>>> getSignersAtHash(
      {required String hash}) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getSignersAtHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<List<String>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<List<EthTransactionReceipt>>>>
      getTransactionReceiptsByBlock({required String block}) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getTransactionReceiptsByBlock',
      'params': [block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(
          AlchemyResponse<List<EthTransactionReceipt>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthTransaction>>>
      getTransactionByBlockHashAndIndex({
    required String hash,
    required String index,
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getTransactionByBlockHashAndIndex',
      'params': [hash, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthTransaction>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> sendRawTransaction({
    required String signedData,
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_sendRawTransaction',
      'params': [signedData],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> getBalance({
    required String address,
    String block = 'latest',
  }) async {
    final result = await client.request({
      'id': '0',
      'method': 'eth_getBalance',
      'params': [address, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> getCode({
    required String address,
    String block = 'latest',
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getCode',
      'params': [address, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> getStorageAt({
    required String address,
    required String index,
    String block = 'latest',
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getStorageAt',
      'params': [address, index, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }
}
