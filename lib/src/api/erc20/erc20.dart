import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:alchemy_web3/src/api/eth.dart';
import 'package:either_dart/either.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class ERC20TokenAPI extends EthAPI with AlchemyConsoleMixin {
  // FUNCTIONS

  Future<Either<RPCErrorData, EtherAmount>> balanceOf({
    required DeployedContract contract,
    required EthereumAddress address,
  }) async {
    final function = contract.function('balanceOf');
    final result = await _call(function, contract, params: [address]);

    return result.fold(
      (error) => Left(error),
      (response) {
        if (response == '0x') return Right(EtherAmount.zero());

        return Right(EtherAmount.inWei(
          hexToInt(response),
        ));
      },
    );
  }

  Future<Either<RPCErrorData, String>> name({
    required DeployedContract contract,
  }) async {
    final function = contract.function('name');
    final result = await _call(function, contract);

    return result.fold(
      (error) => Left(error),
      (response) {
        final decoded = function.decodeReturnValues(response);
        return Right(decoded.first as String);
      },
    );
  }

  Future<Either<RPCErrorData, String>> symbol({
    required DeployedContract contract,
  }) async {
    final function = contract.function('symbol');
    final result = await _call(function, contract);

    return result.fold(
      (error) => Left(error),
      (response) {
        final decoded = function.decodeReturnValues(response);
        return Right(decoded.first as String);
      },
    );
  }

  // Future<Either<RPCErrorData, String>> transfer({
  //   required DeployedContract contract,
  //   required EthereumAddress to,
  //   required BigInt amount,
  // }) async {
  //   final function = contract.function('transfer');
  //   return await sendRawTransaction(signedData: signedData);
  // }

  Future<Either<RPCErrorData, String>> _call(
    ContractFunction function,
    DeployedContract contract, {
    List<dynamic> params = const [],
  }) async {
    final encodedParams = function.encodeCall(params);

    return await call(
      call: EthTransactionCall(
        to: contract.address.hex,
        data: bytesToHex(encodedParams, include0x: true, padToEvenLength: true),
      ),
    );
  }
}
