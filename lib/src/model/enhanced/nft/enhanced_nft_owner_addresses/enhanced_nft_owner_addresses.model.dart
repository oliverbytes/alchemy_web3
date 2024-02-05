import 'package:alchemy_web3/src/model/enhanced/nft/enhanced_nft_owner_addresses/models/enhanced_nft_owner_address/enhanced_nft_owner_address.model.dart';

class EnhancedNFTOwnerAddresses {
  EnhancedNFTOwnerAddresses({
    this.ownerAddresses = const [],
  });

  final List<EnhancedNFTOwnerAddress> ownerAddresses;

  factory EnhancedNFTOwnerAddresses.fromJson(Map<String, dynamic> json) => EnhancedNFTOwnerAddresses(
        ownerAddresses: List<EnhancedNFTOwnerAddress>.from(json["ownerAddresses"]
            .map((x) => x is String ? EnhancedNFTOwnerAddress(ownerAddress: x) : EnhancedNFTOwnerAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ownerAddresses": List<EnhancedNFTOwnerAddress>.from(ownerAddresses.map((x) => x.toJson())),
      };
}

