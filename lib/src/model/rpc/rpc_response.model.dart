import 'rpc_error.model.dart';

class RpcResponse {
  final String jsonrpc;
  final RPCError error;
  final int id;

  RpcResponse({
    required this.jsonrpc,
    required this.error,
    required this.id,
  });

  factory RpcResponse.fromJson(Map<String, dynamic> json) => RpcResponse(
        jsonrpc: json["jsonrpc"],
        error: RPCError.fromJson(json["error"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "error": error.toJson(),
        "id": id,
      };
}
