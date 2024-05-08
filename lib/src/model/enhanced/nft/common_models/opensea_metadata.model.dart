class OpenSeaMetadata {
  OpenSeaMetadata({
    this.floorPrice,
    this.collectionName,
    this.collectionSlug,
    this.safelistRequestStatus,
    this.imageUrl,
    this.description,
    this.externalUrl,
    this.twitterUsername,
    this.discordUrl,
    this.lastIngestedAt,
    this.bannerImageUrl,
  });

  double? floorPrice;
  String? collectionName;
  String? safelistRequestStatus;
  String? imageUrl;
  String? description;
  String? collectionSlug;
  String? externalUrl;
  String? twitterUsername;
  String? discordUrl;
  String? bannerImageUrl;
  DateTime? lastIngestedAt;

  factory OpenSeaMetadata.fromJson(Map<String, dynamic> json) => OpenSeaMetadata(
        floorPrice: json["floorPrice"],
        collectionName: json["collectionName"],
        safelistRequestStatus: json["safelistRequestStatus"],
        imageUrl: json["imageUrl"],
        description: json["description"],
        collectionSlug: json["collectionSlug"],
        externalUrl: json["externalUrl"],
        twitterUsername: json["twitterUsername"],
    bannerImageUrl: json["bannerImageUrl"],
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
        "collectionSlug": collectionSlug,
        "discordUrl": discordUrl,
        "bannerImageUrl": bannerImageUrl,
        "lastIngestedAt": lastIngestedAt,
      };
}
