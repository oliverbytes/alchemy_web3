class EnhancedNFTAcquiredAt {
  // Block timestamp of the block where the NFT was most recently acquired.
  final String? blockTimestamp;

  // Block number of the block where the NFT was most recently acquired.
  final String? blockNumber;

  const EnhancedNFTAcquiredAt({
    this.blockTimestamp,
    this.blockNumber,
  });

  factory EnhancedNFTAcquiredAt.fromJson(Map<String, dynamic> json) => EnhancedNFTAcquiredAt(
        blockTimestamp: json["blockTimestamp"]?.toString(),
        blockNumber: json["blockNumber"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "blockTimestamp": blockTimestamp,
        "blockNumber": blockNumber,
      };
}
