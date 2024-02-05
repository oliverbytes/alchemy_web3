import 'package:alchemy_web3/src/model/enhanced/nft/nft.model.dart';

class EnhancedNFTId {
  const EnhancedNFTId({
    this.tokenId = '',
    this.tokenMetadata,
  });

  final String tokenId;
  final EnhancedNFTTokenMetadata? tokenMetadata;

  factory EnhancedNFTId.fromJson(Map<String, dynamic> json) => EnhancedNFTId(
        tokenId: json["tokenId"],
        tokenMetadata: json["tokenMetadata"] != null ? EnhancedNFTTokenMetadata.fromJson(json["tokenMetadata"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "tokenId": tokenId,
        "tokenMetadata": tokenMetadata != null ? tokenMetadata!.toJson() : null,
      };
}
