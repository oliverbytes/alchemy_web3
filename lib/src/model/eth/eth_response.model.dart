import 'package:alchemy_web3/src/model/eth/eth_block.model.dart';
import 'package:alchemy_web3/src/model/eth/eth_fee_history.model.dart';
import 'package:alchemy_web3/src/model/eth/eth_transaction.model.dart';
import 'package:alchemy_web3/src/model/eth/eth_transaction_log.model.dart';
import 'package:alchemy_web3/src/model/eth/eth_transaction_receipt.model.dart';

class EthResponse<T> {
  final String jsonrpc;
  final dynamic id;
  final T? result;

  EthResponse({
    required this.jsonrpc,
    required this.id,
    required this.result,
  });

  factory EthResponse.fromJson(Map<String, dynamic> json) {
    var result = json["result"];

    if (result != null) {
      if (T == EthBlockResult) {
        result = EthBlockResult.fromJson(result);
      } else if (T == EthTransaction) {
        result = EthTransaction.fromJson(result);
      } else if (T == EthTransactionReceipt) {
        result = EthTransactionReceipt.fromJson(result);
      } else if (T == List<EthTransactionReceipt>) {
        result = List<EthTransactionReceipt>.from(
            result.map((x) => EthTransactionReceipt.fromJson(x)));
      } else if (T == List<EthTransactionLog>) {
        result = List<EthTransactionLog>.from(
            result.map((x) => EthTransactionLog.fromJson(x)));
      } else if (T == EthFeeHistory) {
        result = EthFeeHistory.fromJson(result);
      } else if (T == List<String>) {
        result = result.cast<String>();
      }
    }

    return EthResponse(
      jsonrpc: json["jsonrpc"],
      id: json["id"],
      result: result,
    );
  }

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result,
      };
}
