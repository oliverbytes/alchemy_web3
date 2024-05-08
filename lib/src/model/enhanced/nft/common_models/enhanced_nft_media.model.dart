class EnhancedNFTMedia {
  EnhancedNFTMedia({
    this.raw,
    this.gateway,
    this.thumbnail,
    this.format,
    this.bytes,
  });

  String? raw;
  String? gateway;
  String? thumbnail;
  String? format;
  int? bytes;

  factory EnhancedNFTMedia.fromJson(Map<String, dynamic> json) => EnhancedNFTMedia(
        raw: json["raw"],
        gateway: json["gateway"],
        thumbnail: json["thumbnail"],
        format: json["format"],
        bytes: json["bytes"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "gateway": gateway,
        "thumbnail": thumbnail,
        "format": format,
        "bytes": bytes,
      };
}
