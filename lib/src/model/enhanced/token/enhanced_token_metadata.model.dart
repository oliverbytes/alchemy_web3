class EnhancedTokenMetadata {
  EnhancedTokenMetadata({
    this.logo = '',
    this.symbol = '',
    this.decimals = 0,
    this.name = '',
  });

  final String logo;
  final String symbol;
  final int decimals;
  final String name;

  factory EnhancedTokenMetadata.fromJson(Map<String, dynamic> json) =>
      EnhancedTokenMetadata(
        logo: json["logo"] ?? '',
        symbol: json["symbol"],
        decimals: json["decimals"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "logo": logo,
        "symbol": symbol,
        "decimals": decimals,
        "name": name,
      };
}
