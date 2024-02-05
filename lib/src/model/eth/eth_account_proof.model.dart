class EthAccountProof {
  EthAccountProof({
    this.address = '',
    this.accountProof = const [],
    this.balance = '',
    this.codeHash = '',
    this.nonce = '',
    this.storageHash = '',
    this.storageProof = const [],
  });

  final String address;
  final List<String> accountProof;
  final String balance;
  final String codeHash;
  final String nonce;
  final String storageHash;
  final List<StorageProof> storageProof;

  factory EthAccountProof.fromJson(Map<String, dynamic> json) =>
      EthAccountProof(
        address: json["address"],
        accountProof: List<String>.from(json["accountProof"].map((x) => x)),
        balance: json["balance"],
        codeHash: json["codeHash"],
        nonce: json["nonce"],
        storageHash: json["storageHash"],
        storageProof: List<StorageProof>.from(
            json["storageProof"].map((x) => StorageProof.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "accountProof": List<dynamic>.from(accountProof.map((x) => x)),
        "balance": balance,
        "codeHash": codeHash,
        "nonce": nonce,
        "storageHash": storageHash,
        "storageProof": List<dynamic>.from(storageProof.map((x) => x.toJson())),
      };
}

class StorageProof {
  StorageProof({
    this.key = '',
    this.value = '',
    this.proof = const [],
  });

  final String key;
  final String value;
  final List<dynamic> proof;

  factory StorageProof.fromJson(Map<String, dynamic> json) => StorageProof(
        key: json["key"],
        value: json["value"],
        proof: List<dynamic>.from(json["proof"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "proof": List<dynamic>.from(proof.map((x) => x)),
      };
}
