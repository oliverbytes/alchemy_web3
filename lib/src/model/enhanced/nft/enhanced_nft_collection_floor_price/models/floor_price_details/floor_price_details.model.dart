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
