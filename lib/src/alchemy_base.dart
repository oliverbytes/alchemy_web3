import 'api/api.dart' as api;
import 'api/alchemy_client.dart';

class Alchemy {
  // SINGLETON
  static final Alchemy _singleton = Alchemy._internal();

  // FACTORY
  factory Alchemy() => _singleton;

  // VARIABLES
  late AlchemyClient client;

  // ETH / ROOT API
  late api.EthAPI eth;

  // POLYGON API
  late api.PolygonAPI polygon;

  // CONSTRUCTOR
  Alchemy._internal() {
    client = AlchemyClient();

    // ETH API
    eth = api.EthAPI();
    eth.setClient(client);

    // POLYGON API
    polygon = api.PolygonAPI();
    polygon.setClient(client);
  }
}
