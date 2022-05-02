import 'package:alchemy/src/enhanced_http_rpc_client.dart';
import 'package:alchemy/src/api/enhanced/nft.dart';

class EnhancedAPI {
  // VARIABLES
  late EnhancedHttpRpcClient client;

  // APIs
  late NFTAPI nft;

  void setClient(EnhancedHttpRpcClient client) {
    this.client = client;

    nft = NFTAPI();
    nft.setClient(client);
  }
}
