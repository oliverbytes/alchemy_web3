import 'package:alchemy_web3/src/model/enhanced/nft/nft_sales/models/nft_sales_fee/nft_sales_fee.model.dart';

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
        sellerFee: json["sellerFee"] == null ? null : NFTSalesFee.fromJson(json["sellerFee"]),
        protocolFee: json["protocolFee"] == null ? null : NFTSalesFee.fromJson(json["protocolFee"]),
        royaltyFee: json["royaltyFee"] == null ? null : NFTSalesFee.fromJson(json["royaltyFee"]),
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
