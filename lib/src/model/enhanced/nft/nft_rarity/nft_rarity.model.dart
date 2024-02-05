class NFTRarity {
  NFTRarity({
    required this.value,
    required this.traitType,
    required this.prevalence,
  });

  final String value;
  final String traitType;
  final double prevalence;

  factory NFTRarity.fromJson(Map<String, dynamic> json) => NFTRarity(
        value: json["value"],
        traitType: json["trait_type"],
        prevalence: json["prevalence"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "trait_type": traitType,
        "prevalence": prevalence,
      };
}
