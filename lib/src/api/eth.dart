import 'package:either_option/either_option.dart';

import '../../alchemy.dart';
import '../model/response.model.dart';
import 'alchemy_client.dart';

class EthAPI {
  late AlchemyClient client;

  void setClient(AlchemyClient client) {
    this.client = client;
  }

  // FUNCTIONS

  Future<Either<AlchemyError, AlchemyResponse>> blockNumber() async {
    final result = await client.request({
      'id': 0,
      'method': 'eth_blockNumber',
      'params': [],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse.fromJson(response.data)),
    );
  }

  Future<Either<AlchemyError, AlchemyResponse>> getBalance({
    required String address,
    String quantityOrTag = 'latest',
  }) async {
    final result = await client.request({
      'id': '0',
      'method': 'eth_getBalance',
      'params': [address, quantityOrTag],
    });

    return result.fold(
      (error) => Left(error),
      (response) => Right(AlchemyResponse.fromJson(response.data)),
    );
  }
}
