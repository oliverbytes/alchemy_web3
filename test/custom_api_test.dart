import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:alchemy_web3/src/api/api.dart';
import 'package:test/test.dart';

const String _key = 'your_key';

void main() {
  group('Custom API solana tests', () {
    var solanaUrl = 'https://solana-mainnet.g.alchemy.com/v2/$_key';
    RpcHttpClient httpClient = RpcHttpClient();
    httpClient.init(
      url: solanaUrl,
      verbose: true,
    );

    RpcWsClient wsClient = RpcWsClient();
    wsClient.init(
      url: solanaUrl,
      verbose: true,
    );

    CustomApi api = CustomApi();
    api.setHttpClient(httpClient);
    api.setWsClient(wsClient);

    test('Custom API', () async {
      final result = await api.httpRequest(
        method: 'getBalance',
        httpMethod: HTTPMethod.post,
        bodyParameters: ["83astBRguLMdt2h5U1Tpdq5tjFoJ6noeGwaY3mDLVcri"],
      );

      expect(result.isRight, true);
    });
  });
}
