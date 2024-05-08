enum OrderBy {
  asc,
  transferTime,
  desc;

  String toParam() {
    switch (this) {
      case OrderBy.asc:
        return 'asc';
      case OrderBy.desc:
        return 'desc';
      case OrderBy.transferTime:
        return 'transferTime';
    }
  }
}
