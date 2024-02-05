enum NFTFilters {
  SPAM,
  AIRDROPS,
}

enum OrderBy {
  asc,
  transferTime,
  desc;

  String toParam() {
    switch (this) {
      case OrderBy.asc:
        return 'asc';
      case OrderBy.desc:
        return 'desc';
      case OrderBy.transferTime:
        return 'transferTime';
    }
  }
}

enum TokenType {
  ERC721,
  ERC1155,
}

class EnhancedNFT {
  const EnhancedNFT({
    this.contract,
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
        spamInfo: json["spamInfo"] != null ? EnhancedNFTSpam.fromJson(json["spamInfo"]) : null,
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "contract": contract != null ? contract!.toJson() : null,
        "id": id.toJson(),
        "title": title,
        "description": description,
        "balance": balance,
        "tokenUri": tokenUri != null ? tokenUri!.toJson() : null,
        "media": media != null ? List<dynamic>.from(media!.map((x) => x.toJson())) : null,
        "metadata": metadata != null ? metadata!.toJson() : null,
        "timeLastUpdated": timeLastUpdated != null ? timeLastUpdated!.toIso8601String() : null,
        "contractMetadata": contractMetadata != null ? contractMetadata!.toJson() : null,
        "spamInfo": spamInfo != null ? spamInfo!.toJson() : null,
        "error": error,
      };
}

class EnhancedNFTAcquiredAt {
  // Block timestamp of the block where the NFT was most recently acquired.
  final String? blockTimestamp;

  // Block number of the block where the NFT was most recently acquired.
  final String? blockNumber;

  const EnhancedNFTAcquiredAt({
    this.blockTimestamp,
    this.blockNumber,
  });

  factory EnhancedNFTAcquiredAt.fromJson(Map<String, dynamic> json) => EnhancedNFTAcquiredAt(
        blockTimestamp: json["blockTimestamp"],
        blockNumber: json["blockNumber"],
      );

  Map<String, dynamic> toJson() => {
        "blockTimestamp": blockTimestamp,
        "blockNumber": blockNumber,
      };
}

class EnhancedNFTSpam {
  const EnhancedNFTSpam({
    this.isSpam = '',
    this.classifications = const [],
  });

  final String isSpam;
  final List<String> classifications;

  factory EnhancedNFTSpam.fromJson(Map<String, dynamic> json) => EnhancedNFTSpam(
        isSpam: json["isSpam"],
        classifications: List<String>.from(json["classifications"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "isSpam": isSpam,
        "classifications": List<dynamic>.from(classifications.map((x) => x)),
      };
}

class EnhancedNFTContract {
  EnhancedNFTContract({
    required this.address,
    required this.name,
    required this.symbol,
    required this.totalSupply,
    required this.tokenType,
    required this.contractDeployer,
    required this.deployedBlockNumber,
    required this.openSea,
    required this.spamInfo,
  });

  // Address of the held contract
  final String? address;

  // String - NFT contract name.
  final String? name;

  // String - NFT contract symbol abbreviation.
  final String? symbol;

  // String - Total number of NFTs in a given NFT collection.
  final String? totalSupply;

  // String - For valid NFTs, 'ERC721' or 'ERC1155.' For invalid NFTs, a descriptive reason such as 'NO_SUPPORTED_NFT_STANDARD' if the input contract address doesn't support a known NFT standard, or 'NOT_A_CONTRACT' if there is no contract deployed at the input address.
  final String? tokenType;

  // String - Address that deployed the smart contract
  final String? contractDeployer;

  // Number - The Block Number when the deployment transaction is successfully mined
  final num? deployedBlockNumber;

  // OpenSeaMetadata
  final OpenSeaMetadata? openSea;

  // EnhancedNFTSpam
  final EnhancedNFTSpam? spamInfo;

  //from json factory
  factory EnhancedNFTContract.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? openseaMap = json.containsKey('openSea') ? json['openSea'] as Map<String, dynamic> : null;
    Map<String, dynamic>? spamInfoMap = json.containsKey('spamInfo') ? json['spamInfo'] as Map<String, dynamic> : null;

    return EnhancedNFTContract(
      address: json["address"],
      name: json["name"],
      symbol: json["symbol"],
      totalSupply: json["totalSupply"],
      tokenType: json["tokenType"],
      contractDeployer: json["contractDeployer"],
      deployedBlockNumber: json["deployedBlockNumber"],
      openSea: openseaMap == null ? null : OpenSeaMetadata.fromJson(openseaMap),
      spamInfo: spamInfoMap == null ? null : EnhancedNFTSpam.fromJson(spamInfoMap),
    );
  }

  //to json
  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "symbol": symbol,
        "totalSupply": totalSupply,
        "tokenType": tokenType,
        "contractDeployer": contractDeployer,
        "deployedBlockNumber": deployedBlockNumber,
        "openSea": openSea?.toJson(),
        "spamInfo": spamInfo?.toJson(),
      };
}

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

class EnhancedNFTTokenMetadata {
  const EnhancedNFTTokenMetadata({
    this.tokenType = '',
  });

  final String tokenType;

  factory EnhancedNFTTokenMetadata.fromJson(Map<String, dynamic> json) => EnhancedNFTTokenMetadata(
        tokenType: json["tokenType"],
      );

  Map<String, dynamic> toJson() => {
        "tokenType": tokenType,
      };
}

class EnhancedNFTTokenUri {
  const EnhancedNFTTokenUri({
    this.raw = '',
    this.gateway = '',
  });

  final String raw;
  final String gateway;

  factory EnhancedNFTTokenUri.fromJson(Map<String, dynamic> json) => EnhancedNFTTokenUri(
        raw: json["raw"],
        gateway: json["gateway"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "gateway": gateway,
      };
}

class EnhancedNFTMedia {
  EnhancedNFTMedia({
    this.raw,
    this.gateway,
    this.thumbnail,
    this.format,
    this.bytes,
  });

  String? raw;
  String? gateway;
  String? thumbnail;
  String? format;
  int? bytes;

  factory EnhancedNFTMedia.fromJson(Map<String, dynamic> json) => EnhancedNFTMedia(
        raw: json["raw"],
        gateway: json["gateway"],
        thumbnail: json["thumbnail"],
        format: json["format"],
        bytes: json["bytes"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "gateway": gateway,
        "thumbnail": thumbnail,
        "format": format,
        "bytes": bytes,
      };
}

class EnhancedNFTMetadata {
  const EnhancedNFTMetadata({
    this.name = '',
    this.description = '',
    this.image = '',
    this.externalUrl = '',
    this.attributes = const [],
  });

  final String? name;
  final String? description;
  final String? image;
  final String? externalUrl;
  final List<EnhancedNFTAttribute>? attributes;

  factory EnhancedNFTMetadata.fromJson(Map<String, dynamic> json) {
    List<EnhancedNFTAttribute> attributes = [];

    var attributesJson = json['attributes'];

    if (attributesJson is Map<String, dynamic>) {
      attributes = (json["attributes"] as Map<String, dynamic>)
          .entries
          .map((i) => EnhancedNFTAttribute(
                value: i.value,
                traitType: i.key,
              ))
          .toList();
    } else if (attributesJson is List) {
      attributesJson = List<dynamic>.from(attributes.map((x) => x.toJson()));
    }

    return EnhancedNFTMetadata(
      name: json["name"],
      description: json["description"],
      image: json["image"],
      externalUrl: json["external_url"],
      attributes: attributes,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "external_url": externalUrl,
        "attributes": attributes != null ? List<dynamic>.from(attributes!.map((x) => x.toJson())) : null,
      };
}

class EnhancedNFTAttribute {
  const EnhancedNFTAttribute({
    this.value = '',
    this.traitType = '',
  });

  final dynamic value;
  final String? traitType;

  factory EnhancedNFTAttribute.fromJson(Map<String, dynamic> json) => EnhancedNFTAttribute(
        value: json["value"],
        traitType: json["trait_type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "trait_type": traitType,
      };
}

class EnhancedContractMetadata {
  EnhancedContractMetadata({
    required this.name,
    required this.symbol,
    required this.totalSupply,
    required this.tokenType,
    required this.contractDeployer,
    required this.deployedBlockNumber,
    required this.openSea,
  });

  final String? name;
  final String? symbol;
  final String? totalSupply;
  final String tokenType;
  final String? contractDeployer;
  final int? deployedBlockNumber;
  final OpenSeaMetadata? openSea;

  factory EnhancedContractMetadata.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? openseaMap = json.containsKey('openSea') ? json['openSea'] as Map<String, dynamic> : null;

    return EnhancedContractMetadata(
      name: json["name"],
      symbol: json["symbol"],
      totalSupply: json["totalSupply"],
      tokenType: json["tokenType"],
      contractDeployer: json["contractDeployer"],
      deployedBlockNumber: json["deployedBlockNumber"],
      openSea: (openseaMap?.isEmpty ?? true) ? null : OpenSeaMetadata.fromJson(json["openSea"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "totalSupply": totalSupply,
        "tokenType": tokenType,
        "contractDeployer": contractDeployer,
        "deployedBlockNumber": deployedBlockNumber,
        "openSea": openSea?.toJson(),
      };
}

class OpenSeaMetadata {
  OpenSeaMetadata({
    this.floorPrice,
    this.collectionName,
    this.safelistRequestStatus,
    this.imageUrl,
    this.description,
    this.externalUrl,
    this.twitterUsername,
    this.discordUrl,
    this.lastIngestedAt,
  });

  double? floorPrice;
  String? collectionName;
  String? safelistRequestStatus;
  String? imageUrl;
  String? description;
  String? externalUrl;
  String? twitterUsername;
  String? discordUrl;
  DateTime? lastIngestedAt;

  factory OpenSeaMetadata.fromJson(Map<String, dynamic> json) => OpenSeaMetadata(
        floorPrice: json["floorPrice"],
        collectionName: json["collectionName"],
        safelistRequestStatus: json["safelistRequestStatus"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        externalUrl: json["externalUrl"],
        twitterUsername: json["twitterUsername"],
        discordUrl: json["discordUrl"],
        lastIngestedAt: DateTime.tryParse(json["lastIngestedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "floorPrice": floorPrice,
        "collectionName": collectionName,
        "safelistRequestStatus": safelistRequestStatus,
        "imageUrl": imageUrl,
        "description": description,
        "externalUrl": externalUrl,
        "twitterUsername": twitterUsername,
        "discordUrl": discordUrl,
        "lastIngestedAt": lastIngestedAt,
      };
}
