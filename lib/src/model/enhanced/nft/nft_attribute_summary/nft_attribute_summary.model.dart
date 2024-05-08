class NFTAttributeSummary {
  NFTAttributeSummary({
    required this.summary,
    required this.totalSupply,
    required this.contractAddress,
  });

  final Map<String, Map<String, int>> summary;
  final int totalSupply;
  final String contractAddress;

  factory NFTAttributeSummary.fromJson(Map<String, dynamic> json) => NFTAttributeSummary(
        summary: (Map<String, Map<String, dynamic>>.from(json["summary"]))
            .map((key, value) => MapEntry(key, (Map<String, int>.from(value)))),
        totalSupply: json["totalSupply"],
        contractAddress: json["contractAddress"],
      );

  Map<String, dynamic> toJson() => {
        "summary": summary,
        "totalSupply": totalSupply,
        "contractAddress": contractAddress,
      };
}
