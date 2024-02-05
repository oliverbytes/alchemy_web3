import 'package:alchemy_web3/src/model/enhanced/nft/enhanced_nft/common_models/enhanced_nft_spam.model.dart';
import 'package:alchemy_web3/src/model/enhanced/nft/nft.model.dart';

class EnhancedNFT {
  const EnhancedNFT({
    this.contract,
    this.collectionInfo,
    this.id = const EnhancedNFTId(),
    this.balance,
    this.title,
    this.description,
    this.tokenUri,
    this.media,
    this.metadata,
    this.timeLastUpdated,
    this.contractMetadata,
    this.spamInfo,
    this.acquiredAt,
    this.error,
  });

  final EnhancedNFTContract? contract;
  final EnhancedNFTId id;
  final String? balance;
  final String? title;
  final String? description;
  final EnhancedNFTTokenUri? tokenUri;
  final List<EnhancedNFTMedia>? media;
  final EnhancedNFTMetadata? metadata;
  final DateTime? timeLastUpdated;
  final EnhancedContractMetadata? contractMetadata;
  final EnhancedNFTSpam? spamInfo;
  final String? error;
  final EnhancedNFTCollectionInfo? collectionInfo;

  //Only present if the request specified orderBy=transferTime.
  final EnhancedNFTAcquiredAt? acquiredAt;

  String? get imageUrl {
    if (metadata?.image != null && metadata!.image!.contains('ipfs.io')) {
      final cid = metadata!.image!.replaceAll('https://ipfs.io/ipfs/', '');
      return 'https://$cid.ipfs.dweb.link';
    }

    return metadata?.image;
  }

  factory EnhancedNFT.fromJson(Map<String, dynamic> json) => EnhancedNFT(
        contract: json["contract"] != null ? EnhancedNFTContract.fromJson(json["contract"]) : null,
        id: EnhancedNFTId.fromJson(json["id"]),
        title: json["title"],
        description: json["description"],
        balance: json["balance"],
        acquiredAt: json["acquiredAt"] != null ? EnhancedNFTAcquiredAt.fromJson(json["acquiredAt"]) : null,
        tokenUri: json["tokenUri"] != null ? EnhancedNFTTokenUri.fromJson(json["tokenUri"]) : null,
        media: json["media"] != null
            ? List<EnhancedNFTMedia>.from(json["media"].map((x) => EnhancedNFTMedia.fromJson(x)))
            : null,
        metadata: json["metadata"] != null ? EnhancedNFTMetadata.fromJson(json["metadata"]) : null,
        timeLastUpdated: json["timeLastUpdated"] != null ? DateTime.tryParse(json["timeLastUpdated"]) : null,
        contractMetadata:
            json["contractMetadata"] != null ? EnhancedContractMetadata.fromJson(json["contractMetadata"]) : null,
        collectionInfo: json['collection'] != null ? EnhancedNFTCollectionInfo.fromJson(json['collection']) : null,
        spamInfo: json["spamInfo"] != null ? EnhancedNFTSpam.fromJson(json["spamInfo"]) : null,
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "contract": contract != null ? contract!.toJson() : null,
        "id": id.toJson(),
        "title": title,
        "description": description,
        "balance": balance,
        "collection": collectionInfo != null ? collectionInfo!.toJson() : null,
        "tokenUri": tokenUri != null ? tokenUri!.toJson() : null,
        "media": media != null ? List<dynamic>.from(media!.map((x) => x.toJson())) : null,
        "metadata": metadata != null ? metadata!.toJson() : null,
        "timeLastUpdated": timeLastUpdated != null ? timeLastUpdated!.toIso8601String() : null,
        "contractMetadata": contractMetadata != null ? contractMetadata!.toJson() : null,
        "spamInfo": spamInfo != null ? spamInfo!.toJson() : null,
        "error": error,
      };
}
