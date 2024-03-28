import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:alchemy_web3/src/utils/extensions/map_extensions.dart';
import 'package:alchemy_web3/src/utils/formatting.dart';
import 'package:either_dart/either.dart';
import 'package:web3dart/web3dart.dart';

class EthAPI with AlchemyConsoleMixin {
  late RpcWsClient wsClient;

  void setClient(RpcWsClient client) {
    wsClient = client;
  }

  // FUNCTIONS

  Future<Either<RPCErrorData, String>> blockNumber() async {
    final result = await wsClient.request(method: 'eth_blockNumber', params: []);

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, EthBlockResult>> getBlockByHash({
    required String hash,
    bool asObject = true, // return as object or hash only
  }) async {
    final result = await wsClient.request(
      method: 'eth_getBlockByHash',
      params: [hash, asObject],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthBlockResult.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, EthBlockResult>> getBlockByNumber({
    required String block,
    bool asObject = true, // return as object or hash only
  }) async {
    final result = await wsClient.request(
      method: 'eth_getBlockByNumber',
      params: [block, asObject],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthBlockResult.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, EthTransaction>> getTransactionByHash({required String hash}) async {
    final result = await wsClient.request(
      method: 'eth_getTransactionByHash',
      params: [hash],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthTransaction.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, String>> getTransactionCount({
    required String address,
    String block = 'latest',
  }) async {
    final result = await wsClient.request(
      method: 'eth_getTransactionCount',
      params: [address, block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, EthTransactionReceipt>> getTransactionReceipt({required String hash}) async {
    final result = await wsClient.request(
      method: 'eth_getTransactionReceipt',
      params: [hash],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthTransactionReceipt.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, String>> getBlockTransactionCountByHash({required String hash}) async {
    final result = await wsClient.request(
      method: 'eth_getBlockTransactionCountByHash',
      params: [hash],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, String>> getBlockTransactionCountByNumber({required String block}) async {
    final result = await wsClient.request(
      method: 'eth_getBlockTransactionCountByNumber',
      params: [block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, String>> getTransactionByBlockNumberAndIndex({
    required String block,
    required String index,
  }) async {
    final result = await wsClient.request(
      method: 'eth_getTransactionByBlockNumberAndIndex',
      params: [block, index],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, String>> getRootHash({
    required int from,
    required int to,
  }) async {
    final result = await wsClient.request(
      method: 'eth_getRootHash',
      params: [from, to],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, List<String>>> getSignersAtHash({required String hash}) async {
    final result = await wsClient.request(
      method: 'eth_getSignersAtHash',
      params: [hash],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(List<String>.from(response)),
    );
  }

  Future<Either<RPCErrorData, List<EthTransactionReceipt>>> getTransactionReceiptsByBlock(
      {required String block}) async {
    final result = await wsClient.request(
      method: 'eth_getTransactionReceiptsByBlock',
      params: [block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(
        List<EthTransactionReceipt>.from(
          response.map((x) => EthTransactionReceipt.fromJson(x)),
        ),
      ),
    );
  }

  Future<Either<RPCErrorData, BigInt>> getMaxPriorityFeePerGas() async {
    final result = await wsClient.request(
      method: 'eth_maxPriorityFeePerGas',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(hexToInt(response)),
    );
  }

  Future<Either<RPCErrorData, EthTransaction>> getTransactionByBlockHashAndIndex({
    required String hash,
    required String index,
  }) async {
    final result = await wsClient.request(
      method: 'eth_getTransactionByBlockHashAndIndex',
      params: [hash, index],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthTransaction.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, List<EthTransfer>>> getAssetTransfers({
    String? fromAddress,
    String? toAddress,
    List<String> categories = const [
      "external",
    ],
    List<String> contractAddresses = const [],
    String order = "desc",
    bool withMetadata = true,
    String? fromBlock,
    String? toBlock,
    //Max hex string number of results to return per call. Api Defaults to 0x3e8 (1000).
    String? maxCount,
    //Boolean - A boolean to exclude transfers with zero value - zero value is not the same as null value. Defaults to true.
    bool excludeZeroValue = true,
  }) async {
    if (fromAddress == null && toAddress == null) {
      throw Exception('fromAddress or toAddress must be provided');
    }

    var params = {
      "category": categories,
      "order": order,
      "withMetadata": withMetadata,
      "toAddress": toAddress,
      "fromAddress": fromAddress,
      'contractAddresses': contractAddresses,
      'fromBlock': fromBlock,
      'toBlock': toBlock,
    }..removeNullValues();

    final result = await wsClient.request(
      method: 'alchemy_getAssetTransfers',
      params: [params],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(
        List<EthTransfer>.from(
          response['transfers'].map((x) => EthTransfer.fromJson(x)),
        ),
      ),
    );
  }

  Future<Either<RPCErrorData, String>> sendRawTransaction({
    required String signedData,
  }) async {
    final result = await wsClient.request(
      method: 'eth_sendRawTransaction',
      params: [signedData],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, EtherAmount>> getBalance({
    required String address,
    String block = 'latest',
  }) async {
    final result = await wsClient.request(
      method: 'eth_getBalance',
      params: [address, block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EtherAmount.inWei(
        hexToInt(response),
      )),
    );
  }

  Future<Either<RPCErrorData, String>> getCode({
    required String address,
    String block = 'latest',
  }) async {
    final result = await wsClient.request(
      method: 'eth_getCode',
      params: [address, block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, String>> getStorageAt({
    required String address,
    required String index,
    String block = 'latest',
  }) async {
    final result = await wsClient.request(
      method: 'eth_getStorageAt',
      params: [address, index, block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, List<String>>> accounts() async {
    final result = await wsClient.request(
      method: 'eth_accounts',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(List<String>.from(response)),
    );
  }

  Future<Either<RPCErrorData, EthAccountProof>> getProof({
    required String address,
    required List<String> storageKeys,
    String block = 'latest',
  }) async {
    final result = await wsClient.request(
      method: 'eth_getProof',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthAccountProof.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, String>> call({
    required EthTransactionCall call,
    String block = 'latest',
  }) async {
    final result = await wsClient.request(
      method: 'eth_call',
      params: [call.toJson(), block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, List<EthTransactionLog>>> getLogs({
    required List<EthFilterOptions> options,
  }) async {
    final result = await wsClient.request(
      method: 'eth_getLogs',
      params: List<dynamic>.from(options.map((x) => x.toJson())),
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(
        List<EthTransactionLog>.from(
          response.map((x) => EthTransactionLog.fromJson(x)),
        ),
      ),
    );
  }

  Future<Either<RPCErrorData, String>> protocolVersion() async {
    final result = await wsClient.request(
      method: 'eth_protocolVersion',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, EtherAmount>> gasPrice() async {
    final result = await wsClient.request(
      method: 'eth_gasPrice',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EtherAmount.inWei(
        hexToInt(response),
      )),
    );
  }

  Future<Either<RPCErrorData, String>> estimateGas({
    required EthTransactionCall call,
    String block = 'latest',
  }) async {
    final result = await wsClient.request(
      method: 'eth_estimateGas',
      params: [call.toJson(), block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, EthFeeHistory>> feeHistory({
    required int blockCount,
    String block = 'latest',
    List<int> rewardPercentiles = const [],
  }) async {
    final result = await wsClient.request(
      method: 'eth_feeHistory',
      params: [blockCount, block, rewardPercentiles],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthFeeHistory.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, String>> chainId() async {
    final result = await wsClient.request(
      method: 'eth_chainId',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, EthBlockResult>> getUncleByBlockNumberAndIndex({
    String block = 'latest',
    required String index,
  }) async {
    final result = await wsClient.request(
      method: 'eth_getUncleByBlockNumberAndIndex',
      params: [block, index],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthBlockResult.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, EthBlockResult>> getUncleByBlockHashAndIndex({
    String block = 'latest',
    required String index,
  }) async {
    final result = await wsClient.request(
      method: 'eth_getUncleByBlockHashAndIndex',
      params: [block, index],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(EthBlockResult.fromJson(response)),
    );
  }

  Future<Either<RPCErrorData, String>> getUncleCountByBlockHash({required String hash}) async {
    final result = await wsClient.request(
      method: 'eth_getUncleCountByBlockHash',
      params: [hash],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, String>> getUncleCountByBlockNumber({required String block}) async {
    final result = await wsClient.request(
      method: 'eth_getUncleCountByBlockNumber',
      params: [block],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, List<EthTransactionLog>>> getFilterChanges({required String filterId}) async {
    final result = await wsClient.request(
      method: 'eth_getFilterChanges',
      params: [filterId],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(
        List<EthTransactionLog>.from(
          response.map((x) => EthTransactionLog.fromJson(x)),
        ),
      ),
    );
  }

  Future<Either<RPCErrorData, List<EthTransactionLog>>> getFilterLogs({required String filterId}) async {
    final result = await wsClient.request(
      method: 'eth_getFilterLogs',
      params: [filterId],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(
        List<EthTransactionLog>.from(
          response.map((x) => EthTransactionLog.fromJson(x)),
        ),
      ),
    );
  }

  Future<Either<RPCErrorData, String>> newBlockFilter() async {
    final result = await wsClient.request(
      method: 'eth_newBlockFilter',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, String>> newFilter({
    required List<EthFilterOptions> options,
  }) async {
    final result = await wsClient.request(
      method: 'eth_newFilter',
      params: List<dynamic>.from(options.map((x) => x.toJson())),
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, String>> newPendingTransactionFilter() async {
    final result = await wsClient.request(
      method: 'eth_newPendingTransactionFilter',
      params: [],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }

  Future<Either<RPCErrorData, bool>> uninstallFilter({required String filterId}) async {
    final result = await wsClient.request(
      method: 'eth_uninstallFilter',
      params: [filterId],
    );

    return result.fold(
      (error) => Left(error),
      (response) => Right(response),
    );
  }
}
