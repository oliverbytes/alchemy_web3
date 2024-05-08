class EnhancedNFTAttribute {
  const EnhancedNFTAttribute({
    this.value = '',
    this.traitType = '',
    this.displayType = '',
  });

  final dynamic value;
  final String? displayType;

  final String? traitType;

  factory EnhancedNFTAttribute.fromJson(Map<String, dynamic> json) => EnhancedNFTAttribute(
        value: json["value"],
        traitType: json["trait_type"],
        displayType: json["display_type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "trait_type": traitType,
        "display_type": displayType,
      };
}
