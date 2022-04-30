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
    this.to = '',
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
  final String to;
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

class EthTransactionLog {
  EthTransactionLog({
    this.address = '',
    this.topics = const [],
    this.data = '',
    this.blockNumber = '',
    this.transactionHash = '',
    this.transactionIndex = '',
    this.blockHash = '',
    this.logIndex = '',
    this.removed = false,
  });

  final String address;
  final List<String> topics;
  final String data;
  final String blockNumber;
  final String transactionHash;
  final String transactionIndex;
  final String blockHash;
  final String logIndex;
  final bool removed;

  factory EthTransactionLog.fromJson(Map<String, dynamic> json) =>
      EthTransactionLog(
        address: json["address"],
        topics: List<String>.from(json["topics"].map((x) => x)),
        data: json["data"],
        blockNumber: json["blockNumber"],
        transactionHash: json["transactionHash"],
        transactionIndex: json["transactionIndex"],
        blockHash: json["blockHash"],
        logIndex: json["logIndex"],
        removed: json["removed"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "topics": List<dynamic>.from(topics.map((x) => x)),
        "data": data,
        "blockNumber": blockNumber,
        "transactionHash": transactionHash,
        "transactionIndex": transactionIndex,
        "blockHash": blockHash,
        "logIndex": logIndex,
        "removed": removed,
      };
}
