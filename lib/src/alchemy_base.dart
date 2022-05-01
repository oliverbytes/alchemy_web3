import 'api/api.dart' as api;
import 'api/alchemy_client.dart';

class Alchemy {
  // SINGLETON
  static final Alchemy _singleton = Alchemy._internal();

  // FACTORY
  factory Alchemy() => _singleton;

  // VARIABLES
  late AlchemyClient client;

  // APIs
  late api.EthAPI eth;
  late api.PolygonAPI polygon;
  late api.ArbitrumAPI arbitrum;
  late api.OptimismAPI optimism;
  late api.EnhancedAPI enhanced;

  // CONSTRUCTOR
  Alchemy._internal() {
    client = AlchemyClient();

    // ETH API
    eth = api.EthAPI();
    eth.setClient(client);

    // POLYGON API
    polygon = api.PolygonAPI();
    polygon.setClient(client);

    // ARBITRUM API
    arbitrum = api.ArbitrumAPI();
    arbitrum.setClient(client);

    // OPTIMISM API
    optimism = api.OptimismAPI();
    optimism.setClient(client);

    // ENHANCED API
    enhanced = api.EnhancedAPI();
    enhanced.setClient(client);
  }
}
