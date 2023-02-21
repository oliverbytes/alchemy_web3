class EnhancedNFT {
  EnhancedNFT({
    this.contract = const EnhancedNFTContract(),
    this.contractMetadata = const EnhancedNFTContractMetadata(),
    this.id = const EnhancedNFTId(),
    this.title = '',
    this.description = '',
    this.balance = '',
    this.tokenUri = const EnhancedNFTTokenUri(),
    this.media = const [],
    this.metadata = const EnhancedNFTMetadata(),
    this.timeLastUpdated,
    this.error,
  });

  final EnhancedNFTContract contract;
  final EnhancedNFTContractMetadata contractMetadata;
  final EnhancedNFTId id;
  final String? title;
  final String? description;
  final String? balance;
  final EnhancedNFTTokenUri? tokenUri;
  final List<EnhancedNFTTokenUri> media;
  final EnhancedNFTMetadata? metadata;
  final DateTime? timeLastUpdated;
  final String? error;

  String? get imageUrl {
    if (metadata?.image != null && metadata!.image!.contains('ipfs.io')) {
      final cid = metadata!.image!.replaceAll('https://ipfs.io/ipfs/', '');
      return 'https://$cid.ipfs.dweb.link';
    }

    return metadata?.image;
  }

  factory EnhancedNFT.fromJson(Map<String, dynamic> json) => EnhancedNFT(
        contract: EnhancedNFTContract.fromJson(json["contract"]),
        id: EnhancedNFTId.fromJson(json["id"]),
        title: json["title"],
        description: json["description"],
        balance: json["balance"],
        tokenUri: EnhancedNFTTokenUri.fromJson(json["tokenUri"]),
        media: List<EnhancedNFTTokenUri>.from(json["media"].map((x) => EnhancedNFTTokenUri.fromJson(x))),
        metadata: EnhancedNFTMetadata.fromJson(json["metadata"]),
        timeLastUpdated: DateTime.tryParse(json["timeLastUpdated"]),
        error: json["error"],
        contractMetadata: json.containsKey("contractMetadata")
            ? EnhancedNFTContractMetadata.fromJson(
                json["contractMetadata"],
              )
            : EnhancedNFTContractMetadata(),
      );

  Map<String, dynamic> toJson() => {
        "contract": contract.toJson(),
        "id": id.toJson(),
        "title": title,
        "description": description,
        "balance": balance,
        "tokenUri": tokenUri != null ? tokenUri!.toJson() : null,
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "metadata": metadata != null ? metadata!.toJson() : null,
        "timeLastUpdated": timeLastUpdated != null ? timeLastUpdated!.toIso8601String() : null,
        "error": error,
        "contractMetadata": contractMetadata.toJson(),
      };
}

class EnhancedNFTContractMetadata {
  final String? name;
  final String? symbol;
  final String? tokenType;
  final String? contractDeployer;
  final int? deployedBlockNumber;
  final Map<String, Object?>? jsonData;

  const EnhancedNFTContractMetadata({
    this.name = '',
    this.symbol = '',
    this.tokenType = '',
    this.contractDeployer = '',
    this.deployedBlockNumber = -1,
    this.jsonData,
  });

  factory EnhancedNFTContractMetadata.fromJson(Map<String, dynamic> json) => EnhancedNFTContractMetadata(
        name: json["name"],
        symbol: json["symbol"],
        tokenType: json["tokenType"],
        contractDeployer: json["contractDeployer"],
        deployedBlockNumber: json["deployedBlockNumber"],
        jsonData: json,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "tokenType": tokenType,
        "contractDeployer": contractDeployer,
        "deployedBlockNumber": deployedBlockNumber.toString(),
      };
}

class EnhancedNFTContract {
  const EnhancedNFTContract({
    this.address = '',
  });

  final String address;

  factory EnhancedNFTContract.fromJson(Map<String, dynamic> json) => EnhancedNFTContract(
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
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
        tokenMetadata: EnhancedNFTTokenMetadata.fromJson(json["tokenMetadata"]),
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

  factory EnhancedNFTMetadata.fromJson(Map<String, dynamic> json) => EnhancedNFTMetadata(
        name: json["name"],
        description: json["description"],
        image: json["image"],
        externalUrl: json["external_url"],
        attributes: json["attributes"] != null
            ? List<EnhancedNFTAttribute>.from(json["attributes"].map((x) => EnhancedNFTAttribute.fromJson(x)))
            : null,
      );

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
  final String traitType;

  factory EnhancedNFTAttribute.fromJson(Map<String, dynamic> json) => EnhancedNFTAttribute(
        value: json["value"],
        traitType: json["trait_type"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "trait_type": traitType,
      };
}
