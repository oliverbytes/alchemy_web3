import 'package:alchemy/src/enhanced_http_rpc_client.dart';
import 'package:alchemy/src/ethereum_ws_rpc_client.dart';

import 'api/api.dart' as api;

class Alchemy {
  // SINGLETON
  static final Alchemy _singleton = Alchemy._internal();

  // FACTORY
  factory Alchemy() => _singleton;

  // VARIABLES
  late EthereumWsRpcClient _ethClient;
  late EnhancedHttpRpcClient _enhancedClient;

  // APIs
  late api.EthAPI eth;
  late api.PolygonAPI polygon;
  late api.ArbitrumAPI arbitrum;
  late api.OptimismAPI optimism;
  late api.EnhancedAPI enhanced;

  // CONSTRUCTOR
  Alchemy._internal() {
    // ALCHEMY ENHANCED
    _enhancedClient = EnhancedHttpRpcClient();
    // ENHANCED API
    enhanced = api.EnhancedAPI();
    enhanced.setClient(_enhancedClient);

    // ETHEREUM
    _ethClient = EthereumWsRpcClient();
    // ETH API
    eth = api.EthAPI();
    eth.setClient(_ethClient);
    // POLYGON API
    polygon = api.PolygonAPI();
    polygon.setClient(_ethClient);
    // ARBITRUM API
    arbitrum = api.ArbitrumAPI();
    arbitrum.setClient(_ethClient);
    // OPTIMISM API
    optimism = api.OptimismAPI();
    optimism.setClient(_ethClient);
  }

  void init({
    required String enhancedRpcUrl,
    required String ethereumRpcUrl,
    double? jsonRPCVersion,
    int? receiveTimeout,
    int? sendTimeout,
    bool verbose = true,
  }) {
    _enhancedClient.init(
      url: enhancedRpcUrl,
      jsonRPCVersion: jsonRPCVersion,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
      verbose: verbose,
    );

    _ethClient.init(
      url: ethereumRpcUrl,
      verbose: verbose,
    );
  }
}
