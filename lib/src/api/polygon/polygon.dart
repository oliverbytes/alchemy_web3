import '../alchemy_client.dart';
import '../eth.dart';

class PolygonAPI extends EthAPI {
  late AlchemyClient client;

  void setClient(AlchemyClient client) {
    this.client = client;
  }

  // FUNCTIONS

}
