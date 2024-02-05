class EthTransfer {
  String blockNum;
  String uniqueId;
  String hash;
  String from;

  /// To address of transfer (hex string). null if contract creation.
  String? to;

  /// Converted asset transfer value as a number (raw value divided by contract decimal). null if ERC721 transfer or contract decimal not available.
  double? value;

  ///(Deprecated) Legacy token ID field for ERC721 tokens (hex string). The tokenId field should be used instead.
  String? tokenId;
  String? erc721TokenId;
  List<Erc1155Metadata>? erc1155Metadata;

  /// ETH or the token's symbol. null if not defined in the contract and not available from other sources.
  String? asset;
  String category;
  EthTransferRawContract? rawContract;
  EthTransferMetadata metadata;

  EthTransfer({
    this.value,
    this.blockNum = '',
    this.uniqueId = '',
    this.hash = '',
    this.from = '',
    this.to = '',
    this.erc721TokenId = '',
    this.tokenId = '',
    this.asset = '',
    this.category = '',
    this.rawContract,
    this.erc1155Metadata,
    required this.metadata,
  });

  factory EthTransfer.fromJson(Map<String, dynamic> json) {
    return EthTransfer(
      blockNum: json['blockNum'],
      uniqueId: json['uniqueId'],
      hash: json['hash'],
      from: json['from'],
      to: (json.containsKey('to') && json['to'] != null) != null ? json['to'] : null,
      value: (json.containsKey('value') && json['value'] != null) ? double.parse(json['value'].toString()) : null,
      erc721TokenId: json['erc721TokenId'],
      erc1155Metadata: (json.containsKey('erc1155Metadata') && json['erc1155Metadata'] != null)
          ? List<Erc1155Metadata>.from(
              json['erc1155Metadata'].map((x) => Erc1155Metadata.fromJson(x)).toList(),
            )
          : null,
      tokenId: json['tokenId'],
      asset: (json.containsKey('asset') && json['asset'] != null) != null ? json['asset'] : null,
      category: json['category'],
      rawContract: json['rawContract'] != null ? EthTransferRawContract.fromJson(json['rawContract']) : null,
      metadata: EthTransferMetadata.fromJson(json['metadata']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['blockNum'] = blockNum;
    data['uniqueId'] = uniqueId;
    data['hash'] = hash;
    data['from'] = from;
    data['to'] = to;
    data['value'] = value;
    data['erc721TokenId'] = erc721TokenId;
    data['erc1155Metadata'] = erc1155Metadata == null
        ? null
        : List<dynamic>.from(
            erc1155Metadata!.map((x) => x.toJson()),
          );
    data['tokenId'] = tokenId;
    data['asset'] = asset;
    data['category'] = category;
    if (rawContract != null) {
      data['rawContract'] = rawContract!.toJson();
    }
    data['metadata'] = metadata.toJson();
    return data;
  }

  @override
  String toString() =>
      'EthTransfer{blockNum: $blockNum, uniqueId: $uniqueId, hash: $hash, from: $from, to: $to, value: $value, erc721TokenId: $erc721TokenId, erc1155Metadata: $erc1155Metadata, tokenId: $tokenId, asset: $asset, category: $category, rawContract: $rawContract, metadata: $metadata}';
}

class EthTransferRawContract {
  String? value;
  String? address;
  String? decimal;

  EthTransferRawContract({
    this.value = '',
    this.address = '',
    this.decimal = '',
  });

  factory EthTransferRawContract.fromJson(Map<String, dynamic> json) {
    return EthTransferRawContract(
      value: json['value'],
      address: json['address'],
      decimal: json['decimal'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['address'] = address;
    data['decimal'] = decimal;
    return data;
  }

  @override
  String toString() {
    return 'EthTransferRawContract{value: $value, address: $address, decimal: $decimal}';
  }
}

class EthTransferMetadata {
  DateTime blockTimestamp;

  EthTransferMetadata({
    required this.blockTimestamp,
  });

  factory EthTransferMetadata.fromJson(Map<String, dynamic> json) {
    return EthTransferMetadata(blockTimestamp: DateTime.parse(json['blockTimestamp'].toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['blockTimestamp'] = blockTimestamp;
    return data;
  }

  @override
  String toString() {
    return 'EthTransferMetadata{blockTimestamp: $blockTimestamp}';
  }
}

class Erc1155Metadata {
  String tokenId;
  String value;

  Erc1155Metadata({
    required this.tokenId,
    required this.value,
  });

  factory Erc1155Metadata.fromJson(Map<String, dynamic> json) {
    return Erc1155Metadata(
      tokenId: json['tokenId'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tokenId': tokenId,
      'value': value,
    };
  }

  @override
  String toString() {
    return 'Erc1155Metadata{tokenId: $tokenId, value: $value}';
  }
}
