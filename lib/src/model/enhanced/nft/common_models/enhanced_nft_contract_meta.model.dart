import 'package:alchemy_web3/src/model/enhanced/nft/common_models/enhanced_contract_metadata.model.dart';

class EnhancedNFTContractMetadata {
  EnhancedNFTContractMetadata({
    required this.address,
    required this.contractMetadata,
  });

  final String address;
  final EnhancedContractMetadata contractMetadata;

  factory EnhancedNFTContractMetadata.fromJson(Map<String, dynamic> json) => EnhancedNFTContractMetadata(
        address: json["address"],
        contractMetadata: EnhancedContractMetadata.fromJson(json["contractMetadata"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "contractMetadata": contractMetadata.toJson(),
      };
}
