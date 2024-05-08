import 'models/floor_price_details/floor_price_details.model.dart';

class EnhancedNFTCollectionFloorPrice {
  EnhancedNFTCollectionFloorPrice({
    this.openSea,
    this.looksRare,
  });

  final FloorPriceDetails? openSea;
  final FloorPriceDetails? looksRare;

  factory EnhancedNFTCollectionFloorPrice.fromJson(Map<String, dynamic> json) => EnhancedNFTCollectionFloorPrice(
        openSea: json["openSea"] == null ? null : FloorPriceDetails.fromJson(json["openSea"]),
        looksRare: json["looksRare"] == null ? null : FloorPriceDetails.fromJson(json["looksRare"]),
      );

  Map<String, dynamic> toJson() => {
        "openSea": openSea?.toJson(),
        "looksRare": looksRare!.toJson(),
      };
}
