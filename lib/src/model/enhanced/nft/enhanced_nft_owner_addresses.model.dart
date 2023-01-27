class EnhancedNFTOwnerAddresses {
  EnhancedNFTOwnerAddresses({
    this.ownerAddresses = const [],
  });

  final List<String> ownerAddresses;

  factory EnhancedNFTOwnerAddresses.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTOwnerAddresses(
        ownerAddresses: List<String>.from(json["ownerAddresses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ownerAddresses": List<dynamic>.from(ownerAddresses.map((x) => x)),
      };
}
