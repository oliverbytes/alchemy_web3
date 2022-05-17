class EthTransactionCall {
  EthTransactionCall({
    this.from,
    required this.to,
    this.gas,
    this.gasPrice,
    this.value,
    this.data,
  });

  final String? from;
  final String to;
  final String? gas;
  final String? gasPrice;
  final String? value;
  final String? data;

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
        if (from != null) "from": from,
        "to": to,
        if (gas != null) "gas": gas,
        if (gasPrice != null) "gasPrice": gasPrice,
        if (value != null) "value": value,
        if (data != null) "data": data,
      };
}
