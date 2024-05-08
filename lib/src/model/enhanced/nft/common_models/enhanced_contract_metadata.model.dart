import 'package:alchemy_web3/src/model/enhanced/nft/common_models/opensea_metadata.model.dart';

class EnhancedContractMetadata {
  EnhancedContractMetadata({
    required this.name,
    required this.symbol,
    required this.totalSupply,
    required this.tokenType,
    required this.contractDeployer,
    required this.deployedBlockNumber,
    required this.openSea,
  });

  final String? name;
  final String? symbol;
  final String? totalSupply;
  final String tokenType;
  final String? contractDeployer;
  final int? deployedBlockNumber;
  final OpenSeaMetadata? openSea;

  factory EnhancedContractMetadata.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? openseaMap = json.containsKey('openSea') ? json['openSea'] as Map<String, dynamic> : null;

    return EnhancedContractMetadata(
      name: json["name"],
      symbol: json["symbol"],
      totalSupply: json["totalSupply"],
      tokenType: json["tokenType"],
      contractDeployer: json["contractDeployer"],
      deployedBlockNumber: json["deployedBlockNumber"],
      openSea: (openseaMap?.isEmpty ?? true) ? null : OpenSeaMetadata.fromJson(json["openSea"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
        "totalSupply": totalSupply,
        "tokenType": tokenType,
        "contractDeployer": contractDeployer,
        "deployedBlockNumber": deployedBlockNumber,
        "openSea": openSea?.toJson(),
      };
}
