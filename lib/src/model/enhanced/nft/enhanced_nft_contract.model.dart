import '../../../../alchemy_web3.dart';

class EnhancedContract {
  EnhancedContract({
    required this.address,
    required this.totalBalance,
    required this.numDistinctTokensOwned,
    required this.isSpam,
    required this.tokenId,
    required this.name,
    required this.title,
    required this.symbol,
    required this.totalSupply,
    required this.tokenType,
    required this.contractDeployer,
    required this.deployedBlockNumber,
    required this.openSea,
    required this.media,
  });

  final String? address;
  final int totalBalance;
  final int numDistinctTokensOwned;
  final bool isSpam;
  final String tokenId;
  final String? name;
  final String? title;
  final String? symbol;
  final String? totalSupply;
  final String tokenType;
  final String? contractDeployer;
  final int? deployedBlockNumber;
  final OpenSeaMetadata? openSea;
  final List<EnhancedNFTMedia> media;

  factory EnhancedContract.fromJson(Map<String, dynamic> json) => EnhancedContract(
        address: json["address"],
        totalBalance: json["totalBalance"],
        numDistinctTokensOwned: json["numDistinctTokensOwned"],
        isSpam: json["isSpam"],
        tokenId: json["tokenId"],
        name: json["name"],
        title: json["title"],
        symbol: json["symbol"],
        totalSupply: json["totalSupply"],
        tokenType: json["tokenType"],
        contractDeployer: json["contractDeployer"],
        deployedBlockNumber: json["deployedBlockNumber"],
        openSea: json["openSea"] != null ? OpenSeaMetadata.fromJson(json["openSea"]) : null,
        media: List<EnhancedNFTMedia>.from(json["media"].map((x) => EnhancedNFTMedia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "totalBalance": totalBalance,
        "numDistinctTokensOwned": numDistinctTokensOwned,
        "isSpam": isSpam,
        "tokenId": tokenId,
        "name": name,
        "title": title,
        "symbol": symbol,
        "totalSupply": totalSupply,
        "tokenType": tokenType,
        "contractDeployer": contractDeployer,
        "deployedBlockNumber": deployedBlockNumber,
        "openSea": openSea?.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}
