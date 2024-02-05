import 'eth_transaction_log.model.dart';

class EthTransactionReceipt {
  EthTransactionReceipt({
    this.blockHash = '',
    this.blockNumber = '',
    this.contractAddress = '',
    this.cumulativeGasUsed = '',
    this.from = '',
    this.gasUsed = '',
    this.logs = const [],
    this.logsBloom = '',
    this.status = '',
    this.to,
    this.transactionHash = '',
    this.transactionIndex = '',
    this.type = '',
  });

  final String blockHash;
  final String blockNumber;
  final String? contractAddress;
  final String cumulativeGasUsed;
  final String from;
  final String gasUsed;
  final List<EthTransactionLog> logs;
  final String logsBloom;
  final String status;
  final String? to;
  final String transactionHash;
  final String transactionIndex;
  final String? type;

  factory EthTransactionReceipt.fromJson(Map<String, dynamic> json) =>
      EthTransactionReceipt(
        blockHash: json["blockHash"],
        blockNumber: json["blockNumber"],
        contractAddress: json["contractAddress"],
        cumulativeGasUsed: json["cumulativeGasUsed"],
        from: json["from"],
        gasUsed: json["gasUsed"],
        logs: List<EthTransactionLog>.from(
            json["logs"].map((x) => EthTransactionLog.fromJson(x))),
        logsBloom: json["logsBloom"],
        status: json["status"],
        to: json["to"],
        transactionHash: json["transactionHash"],
        transactionIndex: json["transactionIndex"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "blockHash": blockHash,
        "blockNumber": blockNumber,
        "contractAddress": contractAddress,
        "cumulativeGasUsed": cumulativeGasUsed,
        "from": from,
        "gasUsed": gasUsed,
        "logs": List<dynamic>.from(logs.map((x) => x.toJson())),
        "logsBloom": logsBloom,
        "status": status,
        "to": to,
        "transactionHash": transactionHash,
        "transactionIndex": transactionIndex,
        "type": type,
      };
}
