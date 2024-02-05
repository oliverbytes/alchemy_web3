import 'package:alchemy_web3/alchemy_web3.dart';

class EnhancedNFTMetadata {
  const EnhancedNFTMetadata({
    this.name = '',
    this.description = '',
    this.image = '',
    this.externalUrl = '',
    this.attributes = const [],
  });

  final String? name;
  final String? description;
  final String? image;
  final String? externalUrl;
  final List<EnhancedNFTAttribute>? attributes;

  factory EnhancedNFTMetadata.fromJson(Map<String, dynamic> json) {
    List<EnhancedNFTAttribute> attributes = [];

    var attributesJson = json['attributes'];

    if (attributesJson is Map<String, dynamic>) {
      attributes = (json["attributes"] as Map<String, dynamic>)
          .entries
          .map((i) => EnhancedNFTAttribute(
                value: i.value,
                traitType: i.key,
              ))
          .toList();
    } else if (attributesJson is List) {
      attributesJson = List<dynamic>.from(attributes.map((x) => x.toJson()));
    }

    return EnhancedNFTMetadata(
      name: json["name"],
      description: json["description"],
      image: json["image"],
      externalUrl: json["external_url"],
      attributes: attributes,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "image": image,
        "external_url": externalUrl,
        "attributes": attributes != null ? List<dynamic>.from(attributes!.map((x) => x.toJson())) : null,
      };
}
