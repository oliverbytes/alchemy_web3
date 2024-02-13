// ignore_for_file: constant_identifier_names
enum NFTSpamFilter {
  SPAM,
  AIRDROPS;

  String toParam() {
    switch (this) {
      case NFTSpamFilter.SPAM:
        return 'spam';
      case NFTSpamFilter.AIRDROPS:
        return 'airdrops';
    }
    return '';
  }
}
