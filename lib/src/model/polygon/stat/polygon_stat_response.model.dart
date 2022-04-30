class FilesStatResponse {
  final int blocks;
  final int cumulativeSize;
  final String? hash;
  final bool? local;
  final int size;
  final int? sizeLocal;
  final String type;
  final bool? withLocality;

  FilesStatResponse({
    this.blocks = 0,
    this.cumulativeSize = 0,
    this.hash,
    this.local,
    this.size = 0,
    this.sizeLocal,
    this.type = '',
    this.withLocality,
  });

  factory FilesStatResponse.fromJson(Map<String, dynamic> json) =>
      FilesStatResponse(
        blocks: json["Blocks"],
        cumulativeSize: json["CumulativeSize"],
        hash: json["Hash"],
        local: json["Local"],
        size: json["Size"],
        sizeLocal: json["SizeLocal"],
        type: json["Type"],
        withLocality: json["WithLocality"],
      );

  Map<String, dynamic> toJson() => {
        "Blocks": blocks,
        "CumulativeSize": cumulativeSize,
        "Hash": hash,
        "Local": local,
        "Size": size,
        "SizeLocal": sizeLocal,
        "Type": type,
        "WithLocality": withLocality,
      };
}
