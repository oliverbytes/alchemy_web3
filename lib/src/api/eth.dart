import 'package:alchemy/src/model/eth/eth_account_proof.model.dart';
import 'package:alchemy/src/model/eth/eth_block.model.dart';
import 'package:alchemy/src/model/eth/eth_fee_history.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction_log.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction_receipt.model.dart';
import 'package:alchemy/src/model/filter_options.model.dart';
import 'package:alchemy/src/model/transaction_call.model.dart';
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

  Future<Either<AlchemyError, AlchemyResponse<List<String>>>> accounts() async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_accounts',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<List<String>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthAccountProof>>> getProof({
    required String address,
    required List<String> storageKeys,
    String block = 'latest',
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getProof',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthAccountProof>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> call({
    required EthTransactionCall call,
    String block = 'latest',
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getProof',
      'params': [call.toJson(), block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<List<EthTransactionLog>>>>
      getLogs({
    required List<EthFilterOptions> options,
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getLogs',
      'params': List<dynamic>.from(options.map((x) => x.toJson())),
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(
          AlchemyResponse<List<EthTransactionLog>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>>
      protocolVersion() async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_protocolVersion',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> gasPrice() async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_gasPrice',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> estimateGas({
    required EthTransactionCall call,
    String block = 'latest',
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_estimateGas',
      'params': [call.toJson(), block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthFeeHistory>>> feeHistory({
    required int blockCount,
    String block = 'latest',
    List<int> rewardPercentiles = const [],
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_feeHistory',
      'params': [blockCount, block, rewardPercentiles],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthFeeHistory>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> chainId() async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_chainId',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthBlockResult>>>
      getUncleByBlockNumberAndIndex({
    String block = 'latest',
    required String index,
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getUncleByBlockNumberAndIndex',
      'params': [block, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<EthBlockResult>>>
      getUncleByBlockHashAndIndex({
    String block = 'latest',
    required String index,
  }) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getUncleByBlockHashAndIndex',
      'params': [block, index],
    });

    return result.fold(
      (error) => Left(error),
      (response) =>
          Right(AlchemyResponse<EthBlockResult>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>>
      getUncleCountByBlockHash({required String hash}) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getUncleCountByBlockHash',
      'params': [hash],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>>
      getUncleCountByBlockNumber({required String block}) async {
    final result = await client.request({
      'id': 1,
      'method': 'eth_getUncleCountByBlockNumber',
      'params': [block],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<List<EthTransactionLog>>>>
      getFilterChanges({required String filterId}) async {
    final result = await client.request({
      'id': 73,
      'method': 'eth_getFilterChanges',
      'params': [filterId],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(
          AlchemyResponse<List<EthTransactionLog>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<List<EthTransactionLog>>>>
      getFilterLogs({required String filterId}) async {
    final result = await client.request({
      'id': 74,
      'method': 'eth_getFilterLogs',
      'params': [filterId],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(
          AlchemyResponse<List<EthTransactionLog>>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> newBlockFilter() async {
    final result = await client.request({
      'id': 73,
      'method': 'eth_newBlockFilter',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>> newFilter({
    required List<EthFilterOptions> options,
  }) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_newFilter',
      'params': List<dynamic>.from(options.map((x) => x.toJson())),
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<String>>>
      newPendingTransactionFilter() async {
    final result = await client.request({
      'id': 73,
      'method': 'eth_newPendingTransactionFilter',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<String>.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse<bool>>> uninstallFilter(
      {required String filterId}) async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_uninstallFilter',
      'params': [filterId],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse<bool>.fromJson(response.data)),
    );
  }
}
