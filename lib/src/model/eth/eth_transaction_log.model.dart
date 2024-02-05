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
