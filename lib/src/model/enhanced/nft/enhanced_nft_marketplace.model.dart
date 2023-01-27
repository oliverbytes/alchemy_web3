

class EnhancedNFTCollectionFloorPrice {
  EnhancedNFTCollectionFloorPrice({
    this.openSea,
    this.looksRare,
  });

  final FloorPriceDetails? openSea;
  final FloorPriceDetails? looksRare;

  factory EnhancedNFTCollectionFloorPrice.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTCollectionFloorPrice(
        openSea: json["openSea"] == null
            ? null
            : FloorPriceDetails.fromJson(json["openSea"]),
        looksRare: json["looksRare"] == null
            ? null
            : FloorPriceDetails.fromJson(json["looksRare"]),
      );

  Map<String, dynamic> toJson() => {
        "openSea": openSea != null ? openSea!.toJson() : null,
        "looksRare": looksRare != null ? looksRare!.toJson() : null,
      };
}

class FloorPriceDetails {
  FloorPriceDetails({
    required this.floorPrice,
    required this.priceCurrency,
    required this.retrievedAt,
    required this.collectionUrl,
  });

  final double? floorPrice;
  final String? priceCurrency;
  final DateTime? retrievedAt;
  final String? collectionUrl;

  factory FloorPriceDetails.fromJson(Map<String, dynamic> json) => FloorPriceDetails(
        floorPrice: json["floorPrice"],
        priceCurrency: json["priceCurrency"],
        retrievedAt: DateTime.tryParse(json["retrievedAt"]),
        collectionUrl: json["collectionUrl"],
      );

  Map<String, dynamic> toJson() => {
        "floorPrice": floorPrice,
        "priceCurrency": priceCurrency,
        "retrievedAt": retrievedAt,
        "collectionUrl": collectionUrl,
      };
}

class NFTSalesResponse {
  NFTSalesResponse({
    required this.nftSales,
    required this.pageKey,
  });

  final List<NFTSales> nftSales;
  final String? pageKey;

  factory NFTSalesResponse.fromJson(Map<String, dynamic> json) => NFTSalesResponse(
    nftSales: List<NFTSales>.from(
        json["nftSales"].map((x) => NFTSales.fromJson(x))),
    pageKey: json["pageKey"],
  );

  Map<String, dynamic> toJson() => {
    "nftSales": nftSales,
    "pageKey": pageKey,
  };
}

class NFTSales {
  NFTSales({
    required this.marketplaceAddress,
    required this.contractAddress,
    required this.tokenId,
    required this.quantity,
    required this.buyerAddress,
    required this.sellerAddress,
    required this.taker,
    required this.sellerFee,
    required this.protocolFee,
    required this.royaltyFee,
    required this.blockNumber,
    required this.logIndex,
    required this.bundleIndex,
    required this.transactionHash,
  });

  final String? marketplaceAddress;
  final String? contractAddress;
  final String? tokenId;
  final String? quantity;
  final String? buyerAddress;
  final String? sellerAddress;
  final String? taker;
  final NFTSalesFee? sellerFee;
  final NFTSalesFee? protocolFee;
  final NFTSalesFee? royaltyFee;
  final int? blockNumber;
  final int? logIndex;
  final int? bundleIndex;
  final String? transactionHash;

  factory NFTSales.fromJson(Map<String, dynamic> json) => NFTSales(
    marketplaceAddress: json["marketplaceAddress"],
    contractAddress: json["contractAddress"],
    tokenId: json["tokenId"],
    quantity: json["quantity"],
    buyerAddress: json["buyerAddress"],
    sellerAddress: json["sellerAddress"],
    taker: json["taker"],
    sellerFee: json["sellerFee"] == null
        ? null
        : NFTSalesFee.fromJson(json["sellerFee"]),
    protocolFee: json["protocolFee"] == null
        ? null
        : NFTSalesFee.fromJson(json["protocolFee"]),
    royaltyFee: json["royaltyFee"] == null
        ? null
        : NFTSalesFee.fromJson(json["royaltyFee"]),
    blockNumber: json["blockNumber"],
    logIndex: json["logIndex"],
    bundleIndex: json["bundleIndex"],
    transactionHash: json["transactionHash"],
  );

  Map<String, dynamic> toJson() => {
    "marketplaceAddress": marketplaceAddress,
    "contractAddress": contractAddress,
    "tokenId": tokenId,
    "quantity": quantity,
    "quantity": quantity,
    "buyerAddress": buyerAddress,
    "sellerAddress": sellerAddress,
    "taker": taker,
    "sellerFee": sellerFee,
    "protocolFee": protocolFee,
    "royaltyFee": royaltyFee,
    "blockNumber": blockNumber,
    "logIndex": logIndex,
    "bundleIndex": bundleIndex,
    "transactionHash": transactionHash,
  };
}

class NFTSalesFee {
  NFTSalesFee({
    required this.amount,
    required this.tokenAddress,
    required this.symbol,
    required this.decimals,
  });

  final String? amount;
  final String? tokenAddress;
  final String? symbol;
  final int? decimals;

  factory NFTSalesFee.fromJson(Map<String, dynamic> json) => NFTSalesFee(
    amount: json["amount"],
    tokenAddress: json["tokenAddress"],
    symbol: json["symbol"],
    decimals: json["decimals"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "tokenAddress": tokenAddress,
    "symbol": symbol,
    "decimals": decimals,
  };
}