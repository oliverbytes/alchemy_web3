import 'package:alchemy/src/model/eth/eth_block.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction.model.dart';
import 'package:alchemy/src/model/eth/eth_transaction_receipt.model.dart';

class AlchemyResponse<T> {
  final String jsonrpc;
  final dynamic id;
  final T? result;

  AlchemyResponse({
    required this.jsonrpc,
    required this.id,
    required this.result,
  });

  factory AlchemyResponse.fromJson(Map<String, dynamic> json) {
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
      }
    }

    return AlchemyResponse(
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
