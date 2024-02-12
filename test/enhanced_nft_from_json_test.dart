import 'package:alchemy_web3/src/model/enhanced/nft/enhanced_nft/enhanced_nft.dart';
import 'package:test/test.dart';

import 'test_assets/test_assets_utils.dart';

main() {
  group('enriched_nft_from_json', () {
    test('enriched_nft_1', () {
      var jsonFromFile = TestAssetsUtils.jsonFromFile('test/test_assets/enhanced_nft_1.json');
      var enhancedNFT = EnhancedNFT.fromJson(jsonFromFile);
      print(enhancedNFT);

      expect(enhancedNFT.error, null);
      //contract info
      expect(enhancedNFT.contractAddress, '0x34d85c9cdeb23fa97cb08333b511ac86e1c4e258');
      expect(enhancedNFT.contractMetadata!.name, 'Otherdeed');
      expect(enhancedNFT.contractMetadata!.name, 'Otherdeed');
      expect(enhancedNFT.contractMetadata!.symbol, 'OTHR');
      expect(enhancedNFT.contractMetadata!.totalSupply, '100000');
      expect(enhancedNFT.contractMetadata!.tokenType, 'ERC721');
      expect(enhancedNFT.contractMetadata!.deployedBlockNumber, 14672945);
      //contract opense info
      expect(enhancedNFT.contractMetadata!.openSea!.floorPrice, 0.479989);
      expect(enhancedNFT.contractMetadata!.openSea!.collectionName, "Otherdeed for Otherside");
      expect(enhancedNFT.contractMetadata!.openSea!.collectionSlug, "otherdeed");
      expect(enhancedNFT.contractMetadata!.openSea!.safelistRequestStatus, "verified");
      expect(enhancedNFT.contractMetadata!.openSea!.imageUrl,
          "https://lh3.googleusercontent.com/yIm-M5-BpSDdTEIJRt5D6xphizhIdozXjqSITgK4phWq7MmAU3qE7Nw7POGCiPGyhtJ3ZFP8iJ29TFl-RLcGBWX5qI4-ZcnCPcsY4zI=s120");
      expect(enhancedNFT.contractMetadata!.openSea!.description,
          'Otherdeed is the key to claiming land in Otherside. Each have a unique blend of environment and sediment — some with resources, some home to powerful artifacts. And on a very few, a Koda roams.');
      expect(enhancedNFT.contractMetadata!.openSea!.twitterUsername, 'othersidemeta');
      expect(enhancedNFT.contractMetadata!.openSea!.discordUrl, "https://discord.gg/the-otherside");
      expect(enhancedNFT.contractMetadata!.openSea!.bannerImageUrl,
          "https://lh3.googleusercontent.com/E_XVuM8mX1RuqBym2JEX4RBg_sj9KbTFBAi0qU4eBr2E3VCC0bwpWrgHqBOaWsKGTf4-DBseuZJGvsCVBnzLjxqgq7rAb_93zkZ-=s2500");
      expect(enhancedNFT.contractMetadata!.openSea!.lastIngestedAt, DateTime.parse("2024-02-04T21:28:43.000Z"));
      //id
      expect(enhancedNFT.id.tokenId, "48170");
      expect(enhancedNFT.id.tokenMetadata!.tokenType, "ERC721");

      //title/description
      expect(enhancedNFT.title, isEmpty);
      expect(enhancedNFT.description, isEmpty);

      //token uri
      expect(enhancedNFT.tokenUri!.gateway, 'https://api.otherside.xyz/lands/48170');
      expect(enhancedNFT.tokenUri!.raw, 'https://api.otherside.xyz/lands/48170');

      //media
      expect(enhancedNFT.media!.length, 1);
      expect(
          enhancedNFT.media!.first.gateway, 'https://nft-cdn.alchemy.com/eth-mainnet/a103ef63393fe4e99d7b4d1f49437369');
      expect(enhancedNFT.media!.first.thumbnail,
          "https://res.cloudinary.com/alchemyapi/image/upload/thumbnailv2/eth-mainnet/a103ef63393fe4e99d7b4d1f49437369");
      expect(enhancedNFT.media!.first.raw,
          "https://assets.otherside.xyz/otherdeeds/63ab9ba310e78934622a2817dee873d66ca392cb39ae6a52be73e0b16b24cf70.jpg");
      expect(enhancedNFT.media!.first.format, "jpeg");
      expect(enhancedNFT.media!.first.bytes, 1574180);

      //token metadata
      expect(enhancedNFT.metadata!.image,
          "https://assets.otherside.xyz/otherdeeds/63ab9ba310e78934622a2817dee873d66ca392cb39ae6a52be73e0b16b24cf70.jpg");
      expect(enhancedNFT.metadata!.description, null);
      expect(enhancedNFT.metadata!.name, null);
      expect(enhancedNFT.metadata!.backgroundColor, null);

      //metadata attributes
      expect(enhancedNFT.metadata!.attributes!.length, 12);
      var attribute = enhancedNFT.metadata!.attributes![2];
      expect(attribute.displayType, 'number');
      expect(attribute.traitType, "Sediment Tier");
      expect(attribute.value, 1);
    });
  });
}
