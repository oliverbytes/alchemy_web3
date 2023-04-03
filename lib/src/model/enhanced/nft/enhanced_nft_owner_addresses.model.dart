class EnhancedNFTOwnerAddresses {
  EnhancedNFTOwnerAddresses({
    this.ownerAddresses = const [],
  });

  final List<EnhancedNFTOwnerAddress> ownerAddresses;
  // TODO: pageKey

  factory EnhancedNFTOwnerAddresses.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTOwnerAddresses(
        ownerAddresses: List<EnhancedNFTOwnerAddress>.from(json["ownerAddresses"].map((x) =>
            x is String
                ? EnhancedNFTOwnerAddress(ownerAddress: x)
                : EnhancedNFTOwnerAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ownerAddresses": List<EnhancedNFTOwnerAddress>.from(ownerAddresses.map((x) => x.toJson())),
      };
}

class EnhancedNFTOwnerAddress {
  EnhancedNFTOwnerAddress({
    required this.ownerAddress,
    this.tokenBalances = const [],
  });

  final String ownerAddress;
  final List<EnhancedNFTTokenBalances> tokenBalances;

  factory EnhancedNFTOwnerAddress.fromJson(Map<String, dynamic> json) => EnhancedNFTOwnerAddress(
        ownerAddress: json["ownerAddress"],
        tokenBalances: List<EnhancedNFTTokenBalances>.from(
            json["tokenBalances"].map((x) => EnhancedNFTTokenBalances.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ownerAddress": ownerAddress,
        "tokenBalances": List<EnhancedNFTTokenBalances>.from(tokenBalances.map((x) => x.toJson())),
      };
}

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
