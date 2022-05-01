import 'package:alchemy/src/api/enhanced/nft.dart';

import '../alchemy_client.dart';

class EnhancedAPI {
  // VARIABLES
  late AlchemyClient client;

  // APIs
  late NFTAPI nft;

  void setClient(AlchemyClient client) {
    this.client = client;

    nft = NFTAPI();
    nft.setClient(client);
  }
}
