import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:alchemy_web3/src/utils/my_logger.dart';

class EnhancedNFTMetadata {
  const EnhancedNFTMetadata({
    this.animationUrl = '',
    this.name = '',
    this.backgroundColor = '',
    this.description = '',
    this.image = '',
    this.externalUrl = '',
    this.attributes = const [],
  });

  final String? name;
  final String? description;
  final String? backgroundColor;
  final String? image;
  final String? externalUrl;
  final String? animationUrl;
  final List<EnhancedNFTAttribute>? attributes;

  factory EnhancedNFTMetadata.fromJson(Map<String, dynamic> json) {
    List<EnhancedNFTAttribute> attributes = [];

    try {
      var attributesJson = json['attributes'];

      if (attributesJson is Map<String, dynamic>) {
        attributes = (json["attributes"] as Map<String, dynamic>)
            .entries
            .map(
              (i) => EnhancedNFTAttribute.fromJson(i.value),
            )
            .toList();
      } else if (attributesJson is List) {
        var attributesJsonList = attributesJson;
        attributes = attributesJsonList.map(
          (e) {
            return EnhancedNFTAttribute.fromJson(e);
          },
        ).toList();
      }
    } catch (e, st) {
      globalLogger.error('error parsing attributes', e, st);
    }

    return EnhancedNFTMetadata(
      name: json["name"],
      animationUrl: json["animation_url"],
      description: json["description"],
      image: json["image"],
      externalUrl: json["external_url"],
      backgroundColor: json["background_color"],
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
