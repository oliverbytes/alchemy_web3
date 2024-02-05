class EnhancedNFTOwners {
  EnhancedNFTOwners({
    this.owners = const [],
  });

  final List<String> owners;

  factory EnhancedNFTOwners.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTOwners(
        owners: List<String>.from(json["owners"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "owners": List<dynamic>.from(owners.map((x) => x)),
      };
}
