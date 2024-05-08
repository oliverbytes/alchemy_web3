class NFTSalesFee {
  NFTSalesFee({
    required this.amount,
    required this.tokenAddress,
    required this.symbol,
    required this.decimals,
  });

  final String? amount;
  final String? tokenAddress;
  final String? symbol;
  final int? decimals;

  factory NFTSalesFee.fromJson(Map<String, dynamic> json) => NFTSalesFee(
        amount: json["amount"],
        tokenAddress: json["tokenAddress"],
        symbol: json["symbol"],
        decimals: json["decimals"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "tokenAddress": tokenAddress,
        "symbol": symbol,
        "decimals": decimals,
      };
}
