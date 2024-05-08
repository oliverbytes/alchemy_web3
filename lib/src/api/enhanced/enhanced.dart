import 'package:alchemy_web3/src/api/enhanced/token.dart';
import 'package:alchemy_web3/src/client/rpc_http_client.dart';
import 'package:alchemy_web3/src/api/enhanced/nft.dart';
import 'package:alchemy_web3/src/client/rpc_ws_client.dart';

class EnhancedAPI {
  // VARIABLES
  late RpcHttpClient httpClient;
  late RpcWsClient wsClient;

  // APIs
  late EnhancedNFTAPI nft;
  late EnhancedTokenAPI token;

  void setHttpClient(RpcHttpClient client) {
    httpClient = client;

    // NFT
    nft = EnhancedNFTAPI();
    nft.setClient(httpClient);
  }

  void setWsClient(RpcWsClient client) {
    wsClient = client;

    // TOKEN
    token = EnhancedTokenAPI();
    token.setClient(client);
  }
}
