class EnhancedNFTTokenBalances {
  EnhancedNFTTokenBalances({
    this.tokenId = '',
    this.balance = 0,
  });

  final String tokenId;
  final int balance;

  factory EnhancedNFTTokenBalances.fromJson(Map<String, dynamic> json) => EnhancedNFTTokenBalances(
        tokenId: json["tokenId"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "balance": balance,
      };
}
