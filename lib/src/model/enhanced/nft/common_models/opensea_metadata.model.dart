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
