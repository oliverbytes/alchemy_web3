import 'package:alchemy_web3/src/model/enhanced/nft/enhanced_nft_owner_addresses/models/enhanced_nft_owner_address/models/enhanced_nft_token_balances/enhanced_nft_token_balances.model.dart';

class EnhancedNFTOwnerAddress {
  EnhancedNFTOwnerAddress({
    required this.ownerAddress,
    this.tokenBalances = const [],
  });

  final String ownerAddress;
  final List<EnhancedNFTTokenBalances> tokenBalances;

  factory EnhancedNFTOwnerAddress.fromJson(Map<String, dynamic> json) => EnhancedNFTOwnerAddress(
        ownerAddress: json["ownerAddress"],
        tokenBalances:
            List<EnhancedNFTTokenBalances>.from(json["tokenBalances"].map((x) => EnhancedNFTTokenBalances.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ownerAddress": ownerAddress,
        "tokenBalances": List<EnhancedNFTTokenBalances>.from(tokenBalances.map((x) => x.toJson())),
      };
}
