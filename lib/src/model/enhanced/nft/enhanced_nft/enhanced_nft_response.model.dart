import 'enhanced_nft.model.dart';

class EnhancedNFTResponse {
  EnhancedNFTResponse({
    this.ownedNfts = const [],
    this.totalCount = 0,
    this.blockHash = '',
    this.pageKey,
  });

  final List<EnhancedNFT> ownedNfts;
  final int totalCount;
  final String blockHash;
  final String? pageKey;

  factory EnhancedNFTResponse.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTResponse(
        ownedNfts: List<EnhancedNFT>.from(
            json["ownedNfts"].map((x) => EnhancedNFT.fromJson(x))),
        totalCount: json["totalCount"],
        blockHash: json["blockHash"],
        pageKey: json["pageKey"],
      );

  Map<String, dynamic> toJson() => {
        "ownedNfts": List<dynamic>.from(ownedNfts.map((x) => x.toJson())),
        "totalCount": totalCount,
        "blockHash": blockHash,
        "pageKey": pageKey,
      };
}
