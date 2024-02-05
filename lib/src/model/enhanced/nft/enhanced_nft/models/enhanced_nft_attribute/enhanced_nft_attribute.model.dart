class EnhancedNFTAttribute {
  const EnhancedNFTAttribute({
    this.value = '',
    this.traitType = '',
  });

  final dynamic value;
  final String? traitType;

  factory EnhancedNFTAttribute.fromJson(Map<String, dynamic> json) => EnhancedNFTAttribute(
        value: json["value"],
        traitType: json["trait_type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "trait_type": traitType,
      };
}
