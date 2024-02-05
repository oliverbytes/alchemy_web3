class EnhancedNFTSpam {
  const EnhancedNFTSpam({
    this.isSpam = '',
    this.classifications = const [],
  });

  final String isSpam;
  final List<String> classifications;

  factory EnhancedNFTSpam.fromJson(Map<String, dynamic> json) => EnhancedNFTSpam(
    isSpam: json["isSpam"],
    classifications: List<String>.from(json["classifications"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "isSpam": isSpam,
    "classifications": List<dynamic>.from(classifications.map((x) => x)),
  };
}
