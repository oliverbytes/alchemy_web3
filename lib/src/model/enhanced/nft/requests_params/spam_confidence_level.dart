// ignore_for_file: constant_identifier_names

enum SpamConfidenceLevel {
  VERY_HIGH,
  HIGH,
  MEDIUM,
  LOW;

  String toParam() {
    switch (this) {
      case SpamConfidenceLevel.VERY_HIGH:
        return 'VERY_HIGH';
      case SpamConfidenceLevel.HIGH:
        return 'HIGH';
      case SpamConfidenceLevel.MEDIUM:
        return 'MEDIUM';
      case SpamConfidenceLevel.LOW:
        return 'LOW';
    }
  }
}
