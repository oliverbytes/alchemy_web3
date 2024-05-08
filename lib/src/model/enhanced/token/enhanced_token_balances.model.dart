class EnhancedTokenBalances {
  EnhancedTokenBalances({
    this.address = '',
    this.tokenBalances = const [],
    this.pageKey,
  });

  final String address;
  final List<EnhancedTokenBalance> tokenBalances;

  ///pageKey: String - Applies only to the erc20 request type. An address to be passed into the pageKey of the next request in order to paginate through all of an owner's tokens.
  final String? pageKey;

  factory EnhancedTokenBalances.fromJson(Map<String, dynamic> json) => EnhancedTokenBalances(
        address: json["address"],
        pageKey: json.containsKey("pageKey") && json["pageKey"] != null ? json["pageKey"].toString() : null,
        tokenBalances:
            List<EnhancedTokenBalance>.from(json["tokenBalances"].map((x) => EnhancedTokenBalance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "tokenBalances": List<dynamic>.from(tokenBalances.map((x) => x.toJson())),
      };
}

class EnhancedTokenBalance {
  EnhancedTokenBalance({
    this.contractAddress = '',
    this.tokenBalance = '',
    this.error,
  });

  final String contractAddress;
  final String tokenBalance;
  final dynamic error;

  factory EnhancedTokenBalance.fromJson(Map<String, dynamic> json) => EnhancedTokenBalance(
        contractAddress: json["contractAddress"],
        tokenBalance: json["tokenBalance"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "contractAddress": contractAddress,
        "tokenBalance": tokenBalance,
        "error": error,
      };
}
