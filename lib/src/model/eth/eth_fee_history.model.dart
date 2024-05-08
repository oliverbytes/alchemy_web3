class EthFeeHistory {
  EthFeeHistory({
    this.oldestBlock = '',
    this.reward = const [],
    this.baseFeePerGas = const [],
    this.gasUsedRatio = const [],
  });

  final String oldestBlock;
  final List<List<String>> reward;
  final List<String> baseFeePerGas;
  final List<double> gasUsedRatio;

  factory EthFeeHistory.fromJson(Map<String, dynamic> json) => EthFeeHistory(
        oldestBlock: json["oldestBlock"],
        reward: List<List<String>>.from(
            json["reward"].map((x) => List<String>.from(x.map((x) => x)))),
        baseFeePerGas: List<String>.from(json["baseFeePerGas"].map((x) => x)),
        gasUsedRatio:
            List<double>.from(json["gasUsedRatio"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "oldestBlock": oldestBlock,
        "reward": List<dynamic>.from(
            reward.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "baseFeePerGas": List<dynamic>.from(baseFeePerGas.map((x) => x)),
        "gasUsedRatio": List<dynamic>.from(gasUsedRatio.map((x) => x)),
      };
}
