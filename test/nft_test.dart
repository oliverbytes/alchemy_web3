import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:alchemy_web3/src/api/enhanced/nft.dart';
import 'package:alchemy_web3/src/client/rpc_http_client.dart';
import 'package:test/test.dart';

const String key = '<your key>';

void main() {
  group('NFTs', () {
    RpcHttpClient client = RpcHttpClient();
    client.init(
      url: 'https://eth-mainnet.g.alchemy.com/nft/v2/$key',
      verbose: true,
    );
    EnhancedNFTAPI api = EnhancedNFTAPI();
    api.setClient(client);

    String owner = 'vitalik.eth';
    String address = '0x000386e3f7559d9b6a2f5c46b4ad1a9587d59dc3';
    String token = '0x0000000000000000000000000000000000000000000000000000000000000003';

    test('getNFTs', () async {
      var nfts = await api.getNFTs(owner: owner);
      if (nfts.isLeft) {
        fail(nfts.left.error.message);
      }
      EnhancedNFTResponse resp = nfts.right;
      expect(resp, isNotNull);
      expect(resp.blockHash, isNotEmpty);
      expect(resp.pageKey, isNotEmpty);
      expect(resp.totalCount, greaterThan(0));
      expect(resp.ownedNfts.length, greaterThan(0));
      expect(resp.ownedNfts.length, 100); // Page size is 100
      expect(resp.ownedNfts.length, lessThanOrEqualTo(resp.totalCount));
      expect(resp.ownedNfts.first.error, null);
      expect(resp.ownedNfts.first.id.tokenId, isNotEmpty);
      expect(resp.ownedNfts.first.contract.address, isNotEmpty);
      expect(resp.ownedNfts.first.title, isNotNull);
    });

    test('getNFTsParameters', () async {
      var nfts = await api.getNFTs(
          owner: owner,
          withMetadata: true,
          filters: [NFTFilters.AIRDROPS, NFTFilters.SPAM],
          orderBy: OrderBy.asc,
          contractAddresses: ['0x000386e3f7559d9b6a2f5c46b4ad1a9587d59dc3']);
      if (nfts.isLeft) {
        fail(nfts.left.error.message);
      }
      EnhancedNFTResponse resp = nfts.right;
      expect(resp, isNotNull);
      expect(resp.blockHash, isNotEmpty);
      expect(resp.pageKey, isNotEmpty);
      expect(resp.totalCount, greaterThan(0));
      expect(resp.ownedNfts.length, greaterThan(0));
      expect(resp.ownedNfts.length, 100); // Page size is 100
      expect(resp.ownedNfts.length, lessThanOrEqualTo(resp.totalCount));
      expect(resp.ownedNfts.first.error, null);
      expect(resp.ownedNfts.first.id.tokenId, isNotEmpty);
      expect(resp.ownedNfts.first.contract.address, isNotEmpty);
      expect(resp.ownedNfts.first.title, isNotNull);
      for (var nft in resp.ownedNfts) {
        if (nft.spamInfo != null) {
          expect(nft.spamInfo!.isSpam, 'false');
        }
      }
      expect(resp.ownedNfts.first.contractMetadata?.name, isNotNull);
    });

    test('getOwnersForToken', () async {
      var nfts = await api.getOwnersForToken(contractAddress: address, tokenId: token);
      if (nfts.isLeft) {
        fail(nfts.left.error.message);
      }
      EnhancedNFTOwners resp = nfts.right;
      expect(resp, isNotNull);
      expect(resp.owners.length, greaterThan(0));
      expect(resp.owners.first, isNotEmpty);
    });

    test('getOwnersForCollection', () async {
      var nfts = await api.getOwnersForCollection(contractAddress: address);
      if (nfts.isLeft) {
        fail(nfts.left.error.message);
      }
      EnhancedNFTOwnerAddresses resp = nfts.right;
      expect(resp, isNotNull);
      expect(resp.ownerAddresses.length, greaterThan(0));
      expect(resp.ownerAddresses.first, isNotEmpty);
    });

    test('isHolderOfCollection', () async {
      var nfts = await api.isHolderOfCollection(
        wallet: '0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045',
        contractAddress: '0xe785E82358879F061BC3dcAC6f0444462D4b5330',
      );
      if (nfts.isLeft) {
        fail(nfts.left.error.message);
      }
      bool resp = nfts.right;
      expect(resp, isNotNull);
      expect(resp, false);
    });

    test('getContractsForOwner', () async {
      var nfts = await api.getContractsForOwner(
        owner: owner,
        filters: [NFTFilters.AIRDROPS, NFTFilters.SPAM],
      );
      if (nfts.isLeft) {
        fail(nfts.left.error.message);
      }
      EnhancedNFTContracts resp = nfts.right;
      expect(resp, isNotNull);
      expect(resp.pageKey, isNotEmpty);
      expect(resp.totalCount, greaterThan(0));
      expect(resp.contracts.length, greaterThan(0));
      expect(resp.contracts.length, 100); // Page size is 100
      expect(resp.contracts.length, lessThanOrEqualTo(resp.totalCount));
      expect(resp.contracts.first.tokenType, isNotNull);
      expect(resp.contracts.first.name, isNotNull);
      //expect(resp.contracts.first.openSea?.imageUrl, isNotNull);
      expect(resp.contracts.first.media.length, greaterThan(0));
      expect(resp.contracts.first.media.first.raw, isNotNull);
    });

    test('getNFTMetadata', () async {
      var nfts = await api.getNFTMetadata(
        contractAddress: '0xe785E82358879F061BC3dcAC6f0444462D4b5330',
        tokenId: '44',
        tokenType: TokenType.ERC721,
        refreshCache: false,
      );
      if (nfts.isLeft) {
        fail(nfts.left.error.message);
      }
      EnhancedNFT resp = nfts.right;
      expect(resp, isNotNull);
      expect(resp.title, 'WoW #44');
      expect(resp.imageUrl, 'ipfs://QmUkdJKCsV8ixm2eDLJGosH8Bntwwx942YXxfuF9yXPBzi');
      expect(resp.tokenUri!.raw, 'ipfs://QmTNBQDbggLZdKF1fRgWnXsnRikd52zL5ciNu769g9JoUP/44');
      expect(resp.media.first.format, 'png');
      expect(resp.metadata!.name, 'WoW #44');
      expect(resp.contractMetadata!.openSea!.safelistRequestStatus, 'verified');
    });
  });
}
