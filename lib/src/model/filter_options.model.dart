class EthFilterOptions {
  EthFilterOptions({
    this.fromBlock = '',
    this.toBlock = '',
    this.address = '',
    this.topics = const [],
  });

  final String fromBlock;
  final String toBlock;
  final String address;
  final List<dynamic> topics;

  factory EthFilterOptions.fromJson(Map<String, dynamic> json) =>
      EthFilterOptions(
        fromBlock: json["fromBlock"],
        toBlock: json["toBlock"],
        address: json["address"],
        topics: List<dynamic>.from(json["topics"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "fromBlock": fromBlock,
        "toBlock": toBlock,
        "address": address,
        "topics": List<dynamic>.from(topics.map((x) => x)),
      };
}
