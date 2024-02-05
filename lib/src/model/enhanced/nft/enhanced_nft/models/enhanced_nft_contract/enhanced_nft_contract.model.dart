import 'package:alchemy_web3/src/model/enhanced/nft/enhanced_nft/common_models/enhanced_nft_spam.model.dart';
import 'package:alchemy_web3/src/model/enhanced/nft/nft.model.dart';

class EnhancedNFTContract {
  EnhancedNFTContract({
    required this.address,
    required this.name,
    required this.symbol,
    required this.totalSupply,
    required this.tokenType,
    required this.contractDeployer,
    required this.deployedBlockNumber,
    required this.openSea,
    required this.spamInfo,
  });

  // Address of the held contract
  final String? address;

  // String - NFT contract name.
  final String? name;

  // String - NFT contract symbol abbreviation.
  final String? symbol;

  // String - Total number of NFTs in a given NFT collection.
  final String? totalSupply;

  // String - For valid NFTs, 'ERC721' or 'ERC1155.' For invalid NFTs, a descriptive reason such as 'NO_SUPPORTED_NFT_STANDARD' if the input contract address doesn't support a known NFT standard, or 'NOT_A_CONTRACT' if there is no contract deployed at the input address.
  final String? tokenType;

  // String - Address that deployed the smart contract
  final String? contractDeployer;

  // Number - The Block Number when the deployment transaction is successfully mined
  final num? deployedBlockNumber;

  // OpenSeaMetadata
  final OpenSeaMetadata? openSea;

  // EnhancedNFTSpam
  final EnhancedNFTSpam? spamInfo;

  //from json factory
  factory EnhancedNFTContract.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic>? openseaMap = json.containsKey('openSea') ? json['openSea'] as Map<String, dynamic> : null;
    Map<String, dynamic>? spamInfoMap = json.containsKey('spamInfo') ? json['spamInfo'] as Map<String, dynamic> : null;

    return EnhancedNFTContract(
      address: json["address"],
      name: json["name"],
      symbol: json["symbol"],
      totalSupply: json["totalSupply"],
      tokenType: json["tokenType"],
      contractDeployer: json["contractDeployer"],
      deployedBlockNumber: json["deployedBlockNumber"],
      openSea: openseaMap == null ? null : OpenSeaMetadata.fromJson(openseaMap),
      spamInfo: spamInfoMap == null ? null : EnhancedNFTSpam.fromJson(spamInfoMap),
    );
  }

  //to json
  Map<String, dynamic> toJson() => {
        "address": address,
        "name": name,
        "symbol": symbol,
        "totalSupply": totalSupply,
        "tokenType": tokenType,
        "contractDeployer": contractDeployer,
        "deployedBlockNumber": deployedBlockNumber,
        "openSea": openSea?.toJson(),
        "spamInfo": spamInfo?.toJson(),
      };
}
