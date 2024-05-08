import 'package:alchemy_web3/src/model/enhanced/nft/nft_sales/nft_sales.model.dart';

class NFTSalesResponse {
  NFTSalesResponse({
    required this.nftSales,
    required this.pageKey,
  });

  final List<NFTSales> nftSales;
  final String? pageKey;

  factory NFTSalesResponse.fromJson(Map<String, dynamic> json) => NFTSalesResponse(
        nftSales: List<NFTSales>.from(json["nftSales"].map((x) => NFTSales.fromJson(x))),
        pageKey: json["pageKey"],
      );

  Map<String, dynamic> toJson() => {
        "nftSales": nftSales,
        "pageKey": pageKey,
      };
}
