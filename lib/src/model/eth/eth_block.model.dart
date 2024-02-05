import 'eth_transaction.model.dart';

class EthBlockResult {
  EthBlockResult({
    this.difficulty = '',
    this.baseFeePerGas = '',
    this.extraData = '',
    this.gasLimit = '',
    this.gasUsed = '',
    this.hash = '',
    this.logsBloom = '',
    this.miner = '',
    this.mixHash = '',
    this.nonce = '',
    this.number = '',
    this.parentHash = '',
    this.receiptsRoot = '',
    this.sha3Uncles = '',
    this.size = '',
    this.stateRoot = '',
    this.timestamp = '',
    this.totalDifficulty = '',
    this.transactions = const [],
    this.transactionsRoot = '',
    this.uncles = const [],
  });

  final String difficulty;
  final String baseFeePerGas;
  final String extraData;
  final String gasLimit;
  final String gasUsed;
  final String hash;
  final String logsBloom;
  final String miner;
  final String mixHash;
  final String nonce;
  final String number;
  final String parentHash;
  final String receiptsRoot;
  final String sha3Uncles;
  final String size;
  final String stateRoot;
  final String timestamp;
  final String totalDifficulty;
  final List<EthTransaction> transactions;
  final String transactionsRoot;
  final List<EthBlockResult> uncles;

  factory EthBlockResult.fromJson(Map<String, dynamic> json) => EthBlockResult(
        difficulty: json["difficulty"],
        baseFeePerGas: json["baseFeePerGas"],
        extraData: json["extraData"],
        gasLimit: json["gasLimit"],
        gasUsed: json["gasUsed"],
        hash: json["hash"] ?? '',
        logsBloom: json["logsBloom"],
        miner: json["miner"] ?? '',
        mixHash: json["mixHash"],
        nonce: json["nonce"] ?? '',
        number: json["number"],
        parentHash: json["parentHash"],
        receiptsRoot: json["receiptsRoot"],
        sha3Uncles: json["sha3Uncles"],
        size: json["size"],
        stateRoot: json["stateRoot"],
        timestamp: json["timestamp"],
        totalDifficulty: json["totalDifficulty"] ?? '',
        transactions: List<EthTransaction>.from(json["transactions"].map((x) => EthTransaction.fromJson(x))),
        transactionsRoot: json["transactionsRoot"],
        uncles: List<EthBlockResult>.from(json["uncles"].map((x) => EthBlockResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "difficulty": difficulty,
        "extraData": extraData,
        "baseFeePerGas": baseFeePerGas,
        "gasLimit": gasLimit,
        "gasUsed": gasUsed,
        "hash": hash,
        "logsBloom": logsBloom,
        "miner": miner,
        "mixHash": mixHash,
        "nonce": nonce,
        "number": number,
        "parentHash": parentHash,
        "receiptsRoot": receiptsRoot,
        "sha3Uncles": sha3Uncles,
        "size": size,
        "stateRoot": stateRoot,
        "timestamp": timestamp,
        "totalDifficulty": totalDifficulty,
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
        "transactionsRoot": transactionsRoot,
        "uncles": List<dynamic>.from(uncles.map((x) => x.toJson())),
      };
}
