class EthTransaction {
  EthTransaction({
    this.blockHash = '',
    this.blockNumber = '',
    this.from = '',
    this.gas = '',
    this.gasPrice = '',
    this.hash = '',
    this.input = '',
    this.nonce = '',
    this.to = '',
    this.transactionIndex = '',
    this.value = '',
    this.type = '',
    this.v = '',
    this.r = '',
    this.s = '',
  });

  final String blockHash;
  final String blockNumber;
  final String from;
  final String gas;
  final String gasPrice;
  final String hash;
  final String input;
  final String nonce;
  final String to;
  final String transactionIndex;
  final String value;
  final String type;
  final String v;
  final String r;
  final String s;

  factory EthTransaction.fromJson(Map<String, dynamic> json) => EthTransaction(
        blockHash: json["blockHash"],
        blockNumber: json["blockNumber"],
        from: json["from"],
        gas: json["gas"],
        gasPrice: json["gasPrice"],
        hash: json["hash"],
        input: json["input"],
        nonce: json["nonce"],
        to: json["to"] ?? '',
        transactionIndex: json["transactionIndex"],
        value: json["value"],
        type: json["type"],
        v: json["v"],
        r: json["r"],
        s: json["s"],
      );

  Map<String, dynamic> toJson() => {
        "blockHash": blockHash,
        "blockNumber": blockNumber,
        "from": from,
        "gas": gas,
        "gasPrice": gasPrice,
        "hash": hash,
        "input": input,
        "nonce": nonce,
        "to": to,
        "transactionIndex": transactionIndex,
        "value": value,
        "type": type,
        "v": v,
        "r": r,
        "s": s,
      };
}
