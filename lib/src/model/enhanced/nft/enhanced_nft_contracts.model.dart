
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
        contracts: List<EnhancedContract>.from(json["contracts"].map((x) => EnhancedContract.fromJson(x))),
        totalCount: json["totalCount"],
        pageKey: json["pageKey"],
      );

  Map<String, dynamic> toJson() => {
        "contracts": List<dynamic>.from(contracts.map((x) => x.toJson())),
        "totalCount": totalCount,
        "pageKey": pageKey,
      };
}
