class EthTransactionCall {
  EthTransactionCall({
    this.from = '',
    this.to = '',
    this.gas = '',
    this.gasPrice = '',
    this.value = '',
    this.data = '',
  });

  final String from;
  final String to;
  final String gas;
  final String gasPrice;
  final String value;
  final String data;

  factory EthTransactionCall.fromJson(Map<String, dynamic> json) =>
      EthTransactionCall(
        from: json["from"],
        to: json["to"],
        gas: json["gas"],
        gasPrice: json["gasPrice"],
        value: json["value"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "gas": gas,
        "gasPrice": gasPrice,
        "value": value,
        "data": data,
      };
}
