class EnhancedNFTCollectionInfo {
  // Collection name
  final String? name;

  // OpenSea collection slug
  final String? slug;

  // URL for the external site of the collection
  final String? externalUrl;

  // Banner image URL for the collection
  final String? bannerImageUrl;

  EnhancedNFTCollectionInfo({
    required this.name,
    required this.slug,
    required this.externalUrl,
    required this.bannerImageUrl,
  });

  factory EnhancedNFTCollectionInfo.fromJson(Map<String, dynamic> json) => EnhancedNFTCollectionInfo(
    name: json["name"],
    slug: json["slug"],
    externalUrl: json["externalUrl"],
    bannerImageUrl: json["bannerImageUrl"],
  );

  //to json
  Map<String, dynamic> toJson() => {
    "name": name,
    "slug": slug,
    "externalUrl": externalUrl,
    "bannerImageUrl": bannerImageUrl,
  };
}
