class EnhancedTokenMetadata {
  EnhancedTokenMetadata({
    this.logo,
    this.symbol,
    this.decimals,
    this.name,
  });

  final String? logo;
  final String? symbol;
  final int? decimals;
  final String? name;

  factory EnhancedTokenMetadata.fromJson(Map<String, dynamic> json) {
    return EnhancedTokenMetadata(
      logo: json["logo"]?.toString(),
      symbol: json["symbol"]?.toString(),
      decimals: json["decimals"] == null ? null : int.tryParse(json["decimals"].toString()),
      name: json["name"] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "symbol": symbol,
        "decimals": decimals,
        "name": name,
      };
}
