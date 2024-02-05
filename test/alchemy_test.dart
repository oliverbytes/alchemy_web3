// import 'package:flutter_test/flutter_test.dart';

// import 'package:alchemy_web3/alchemy.dart';

import 'package:alchemy_web3/alchemy_web3.dart';
import 'package:test/test.dart';

void main() {
  group('EnhancedTokenMetadata', () {
    test('fromJson should correctly deserialize valid JSON data', () {
      final json = {
        "logo": "logo_url",
        "symbol": "ETH",
        "decimals": 18,
        "name": "Ethereum",
      };

      final metadata = EnhancedTokenMetadata.fromJson(json);

      expect(metadata.logo, "logo_url");
      expect(metadata.symbol, "ETH");
      expect(metadata.decimals, 18);
      expect(metadata.name, "Ethereum");
    });

    test('fromJson should handle empty fields JSON data', () {
      final json = {
        "logo": '',
        "symbol": '',
        "decimals": '',
        "name": '',
      };

      final metadata = EnhancedTokenMetadata.fromJson(json);

      expect(metadata.logo, '');
      expect(metadata.symbol, '');
      expect(metadata.decimals, null);
      expect(metadata.name, '');
    });

    test('fromJson should handle empty JSON data', () {
      final metadata = EnhancedTokenMetadata.fromJson({});

      expect(metadata.logo, null);
      expect(metadata.symbol, null);
      expect(metadata.decimals, null);
      expect(metadata.name, null);
    });

    test('toJson should correctly serialize the object to JSON', () {
      final metadata = EnhancedTokenMetadata(
        logo: "logo_url",
        symbol: "ETH",
        decimals: 18,
        name: "Ethereum",
      );

      final json = metadata.toJson();

      expect(json["logo"], "logo_url");
      expect(json["symbol"], "ETH");
      expect(json["decimals"], 18);
      expect(json["name"], "Ethereum");
    });

    // Add more tests as needed to cover other scenarios.
  });
}
