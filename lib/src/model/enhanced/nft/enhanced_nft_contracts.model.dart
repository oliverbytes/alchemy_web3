import '../../../../alchemy_web3.dart';

class EnhancedNFTContracts {
  EnhancedNFTContracts({
    this.contracts = const [],
    this.totalCount = 0,
    this.pageKey,
  });

  final List<EnhancedContract> contracts;
  final int totalCount;
  final String? pageKey;

  factory EnhancedNFTContracts.fromJson(Map<String, dynamic> json) => EnhancedNFTContracts(
        contracts:
            List<EnhancedContract>.from(json["contracts"].map((x) => EnhancedContract.fromJson(x))),
        totalCount: json["totalCount"],
        pageKey: json["pageKey"],
      );

  Map<String, dynamic> toJson() => {
        "contracts": List<dynamic>.from(contracts.map((x) => x.toJson())),
        "totalCount": totalCount,
        "pageKey": pageKey,
      };
}

class EnhancedNFTContractMetadata {
  EnhancedNFTContractMetadata({
    required this.address,
    required this.contractMetadata,
  });

  final String address;
  final EnhancedContractMetadata contractMetadata;

  factory EnhancedNFTContractMetadata.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTContractMetadata(
        address: json["address"],
        contractMetadata: EnhancedContractMetadata.fromJson(json["contractMetadata"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "contractMetadata": contractMetadata.toJson(),
      };
}

class EnhancedNFTReingestContract {
  EnhancedNFTReingestContract({
    required this.contractAddress,
    required this.reingestionState,
    required this.progress,
  });

  final String contractAddress;
  final String reingestionState;
  final String? progress;

  factory EnhancedNFTReingestContract.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTReingestContract(
        contractAddress: json["contractAddress"],
        reingestionState: json["reingestionState"],
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "contractAddress": contractAddress,
        "reingestionState": reingestionState,
        "progress": progress,
      };
}
