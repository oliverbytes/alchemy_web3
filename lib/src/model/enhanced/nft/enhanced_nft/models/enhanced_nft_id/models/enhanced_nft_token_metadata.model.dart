class EnhancedNFTTokenMetadata {
  const EnhancedNFTTokenMetadata({
    this.tokenType = '',
  });

  final String tokenType;

  factory EnhancedNFTTokenMetadata.fromJson(Map<String, dynamic> json) => EnhancedNFTTokenMetadata(
        tokenType: json["tokenType"],
      );

  Map<String, dynamic> toJson() => {
        "tokenType": tokenType,
      };
}
