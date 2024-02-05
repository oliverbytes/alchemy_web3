class EnhancedNFTTokenUri {
  const EnhancedNFTTokenUri({
    this.raw = '',
    this.gateway = '',
  });

  final String raw;
  final String gateway;

  factory EnhancedNFTTokenUri.fromJson(Map<String, dynamic> json) => EnhancedNFTTokenUri(
        raw: json["raw"],
        gateway: json["gateway"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "gateway": gateway,
      };
}
