class EthTransfer {
  String blockNum;
  String uniqueId;
  String hash;
  String from;
  String to;
  double value;
  String? erc721TokenId;
  String? erc1155Metadata;
  String? tokenId;
  String asset;
  String category;
  EthTransferRawContract? rawContract;
  EthTransferMetadata metadata;

  EthTransfer({
    this.value = 0,
    this.blockNum = '',
    this.uniqueId = '',
    this.hash = '',
    this.from = '',
    this.to = '',
    this.erc721TokenId = '',
    this.erc1155Metadata = '',
    this.tokenId = '',
    this.asset = '',
    this.category = '',
    this.rawContract,
    required this.metadata,
  });

  factory EthTransfer.fromJson(Map<String, dynamic> json) {
    return EthTransfer(
      blockNum: json['blockNum'],
      uniqueId: json['uniqueId'],
      hash: json['hash'],
      from: json['from'],
      to: json['to'],
      value: double.parse(json['value'].toString()),
      erc721TokenId: json['erc721TokenId'],
      erc1155Metadata: json['erc1155Metadata'],
      tokenId: json['tokenId'],
      asset: json['asset'],
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
    data['erc1155Metadata'] = erc1155Metadata;
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
}
