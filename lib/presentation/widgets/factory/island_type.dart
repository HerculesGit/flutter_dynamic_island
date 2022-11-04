enum IslandType {
  airpods,
  silent,
  changing,
  music,
  lyft,
  phoneCall,
}

extension IslandTypeInfo on IslandType {
  String get label {
    switch (this) {
      case IslandType.airpods:
        return 'Airpods';
      case IslandType.silent:
        return 'Silent';
      case IslandType.changing:
        return 'Changing';
      case IslandType.music:
        return 'Music';
      case IslandType.lyft:
        return 'Lyft';
      case IslandType.phoneCall:
        return 'Phone Call';
      default:
        return 'Phone Call';
    }
  }

  String size(final bool isExpanded) {
    switch (this) {
      case IslandType.airpods:
        return 'Airpods';
      case IslandType.silent:
        return 'Silent';
      case IslandType.changing:
        return 'Changing';
      case IslandType.music:
        return 'Music';
      case IslandType.lyft:
        return 'Lyft';
      case IslandType.phoneCall:
        return 'Phone Call';
      default:
        return 'Phone Call';
    }
  }
}
