class AlchemyResponse {
  final String jsonrpc;
  final dynamic id;
  final dynamic result;

  AlchemyResponse({
    required this.jsonrpc,
    required this.id,
    this.result,
  });

  factory AlchemyResponse.fromJson(Map<String, dynamic> json) =>
      AlchemyResponse(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result,
      };
}
