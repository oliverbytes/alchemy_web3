import 'package:alchemy/src/model/eth/eth_account_proof.model.dart';
import 'package:alchemy/src/model/eth/eth_block.model.dart';
import 'package:alchemy/src/model/eth/eth_fee_history.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction_log.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction_receipt.model.dart';
import 'package:console_mixin/console_mixin.dart';
import 'package:either_dart/either.dart';

import '../../alchemy.dart';
import '../model/eth/eth_response.model.dart';
import 'alchemy_client.dart';

class EthAPI with ConsoleMixin {
  late AlchemyClient client;

  void setClient(AlchemyClient client) {
    this.client = client;
  }

  // FUNCTIONS

  Future<Either<AlchemyError, EthResponse<String>>> blockNumber() async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_blockNumber',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthBlockResult>>> getBlockByHash({
    required String hash,
    bool asObject = true, // return as object or hash only
  }) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getBlockByHash',
      'params': [hash, asObject],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthBlockResult>>> getBlockByNumber({
    required String block,
    bool asObject = true, // return as object or hash only
  }) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getBlockByNumber',
      'params': [block, asObject],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthTransaction>>>
      getTransactionByHash({required String hash}) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getTransactionByHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthTransaction>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> getTransactionCount({
    required String address,
    String block = 'latest',
  }) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getTransactionCount',
      'params': [address, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthTransactionReceipt>>>
      getTransactionReceipt({required String hash}) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getTransactionReceipt',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(EthResponse<EthTransactionReceipt>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>>
      getBlockTransactionCountByHash({required String hash}) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getBlockTransactionCountByHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>>
      getBlockTransactionCountByNumber({required String block}) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getBlockTransactionCountByNumber',
      'params': [block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>>
      getTransactionByBlockNumberAndIndex({
    required String block,
    required String index,
  }) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_getTransactionByBlockNumberAndIndex',
      'params': [block, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> getRootHash({
    required int from,
    required int to,
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getRootHash',
      'params': [from, to],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<List<String>>>> getSignersAtHash(
      {required String hash}) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getSignersAtHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<List<String>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<List<EthTransactionReceipt>>>>
      getTransactionReceiptsByBlock({required String block}) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getTransactionReceiptsByBlock',
      'params': [block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(
          EthResponse<List<EthTransactionReceipt>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthTransaction>>>
      getTransactionByBlockHashAndIndex({
    required String hash,
    required String index,
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getTransactionByBlockHashAndIndex',
      'params': [hash, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthTransaction>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> sendRawTransaction({
    required String signedData,
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_sendRawTransaction',
      'params': [signedData],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> getBalance({
    required String address,
    String block = 'latest',
  }) async {
    final result = await client.request(data: {
      'id': '0',
      'method': 'eth_getBalance',
      'params': [address, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> getCode({
    required String address,
    String block = 'latest',
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getCode',
      'params': [address, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> getStorageAt({
    required String address,
    required String index,
    String block = 'latest',
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getStorageAt',
      'params': [address, index, block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<List<String>>>> accounts() async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_accounts',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<List<String>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthAccountProof>>> getProof({
    required String address,
    required List<String> storageKeys,
    String block = 'latest',
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getProof',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthAccountProof>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> call({
    required EthTransactionCall call,
    String block = 'latest',
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getProof',
      'params': [call.toJson(), block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<List<EthTransactionLog>>>> getLogs({
    required List<EthFilterOptions> options,
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getLogs',
      'params': List<dynamic>.from(options.map((x) => x.toJson())),
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(EthResponse<List<EthTransactionLog>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> protocolVersion() async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_protocolVersion',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> gasPrice() async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_gasPrice',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> estimateGas({
    required EthTransactionCall call,
    String block = 'latest',
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_estimateGas',
      'params': [call.toJson(), block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthFeeHistory>>> feeHistory({
    required int blockCount,
    String block = 'latest',
    List<int> rewardPercentiles = const [],
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_feeHistory',
      'params': [blockCount, block, rewardPercentiles],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthFeeHistory>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> chainId() async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_chainId',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthBlockResult>>>
      getUncleByBlockNumberAndIndex({
    String block = 'latest',
    required String index,
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getUncleByBlockNumberAndIndex',
      'params': [block, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<EthBlockResult>>>
      getUncleByBlockHashAndIndex({
    String block = 'latest',
    required String index,
  }) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getUncleByBlockHashAndIndex',
      'params': [block, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> getUncleCountByBlockHash(
      {required String hash}) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getUncleCountByBlockHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> getUncleCountByBlockNumber(
      {required String block}) async {
    final result = await client.request(data: {
      'id': 1,
      'method': 'eth_getUncleCountByBlockNumber',
      'params': [block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<List<EthTransactionLog>>>>
      getFilterChanges({required String filterId}) async {
    final result = await client.request(data: {
      'id': 73,
      'method': 'eth_getFilterChanges',
      'params': [filterId],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(EthResponse<List<EthTransactionLog>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<List<EthTransactionLog>>>>
      getFilterLogs({required String filterId}) async {
    final result = await client.request(data: {
      'id': 74,
      'method': 'eth_getFilterLogs',
      'params': [filterId],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(EthResponse<List<EthTransactionLog>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> newBlockFilter() async {
    final result = await client.request(data: {
      'id': 73,
      'method': 'eth_newBlockFilter',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>> newFilter({
    required List<EthFilterOptions> options,
  }) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_newFilter',
      'params': List<dynamic>.from(options.map((x) => x.toJson())),
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<String>>>
      newPendingTransactionFilter() async {
    final result = await client.request(data: {
      'id': 73,
      'method': 'eth_newPendingTransactionFilter',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, EthResponse<bool>>> uninstallFilter(
      {required String filterId}) async {
    final result = await client.request(data: {
      'id': 0,
      'method': 'eth_uninstallFilter',
      'params': [filterId],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthResponse<bool>.fromJson(response.data)),
    );
  }
}
