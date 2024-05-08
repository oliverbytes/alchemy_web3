class EnhancedNFTReingestContract {
  EnhancedNFTReingestContract({
    required this.contractAddress,
    required this.reingestionState,
    required this.progress,
  });

  final String contractAddress;
  final String reingestionState;
  final String? progress;

  factory EnhancedNFTReingestContract.fromJson(Map<String, dynamic> json) =>
      EnhancedNFTReingestContract(
        contractAddress: json["contractAddress"],
        reingestionState: json["reingestionState"],
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "contractAddress": contractAddress,
        "reingestionState": reingestionState,
        "progress": progress,
      };
}
