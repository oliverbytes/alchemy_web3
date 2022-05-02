class EnhancedHTTPError {
  final String jsonrpc;
  final RPCError error;
  final int id;

  EnhancedHTTPError({
    required this.jsonrpc,
    required this.error,
    required this.id,
  });

  factory EnhancedHTTPError.fromJson(Map<String, dynamic> json) =>
      EnhancedHTTPError(
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

class RPCError {
  final int code;
  final String message;
  final List<RPCErrorData> data;

  RPCError({
    required this.code,
    required this.message,
    this.data = const [],
  });

  factory RPCError.fromJson(Map<String, dynamic> json) => RPCError(
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? List<RPCErrorData>.from(
                json["data"].map((x) => RPCErrorData.fromJson(x)),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class RPCErrorData {
  final int code;
  final String message;

  RPCErrorData({
    required this.code,
    required this.message,
  });

  factory RPCErrorData.fromJson(Map<String, dynamic> json) => RPCErrorData(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
