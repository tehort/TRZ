enum ItemsEnum {
  fijiWater,
  campbellSoup,
  firstAidPouch,
  ak47,
}

extension ItemsExtension on ItemsEnum {
  String get description {
    switch (this) {
      case ItemsEnum.fijiWater:
        return 'Fiji Water';
      case ItemsEnum.campbellSoup:
        return 'Campbell Soup';
      case ItemsEnum.firstAidPouch:
        return 'First Aid Pouch';
      case ItemsEnum.ak47:
        return 'AK47';
      default:
        return null;
    }
  }

  int get points {
    switch (this) {
      case ItemsEnum.fijiWater:
        return 14;
      case ItemsEnum.campbellSoup:
        return 12;
      case ItemsEnum.firstAidPouch:
        return 10;
      case ItemsEnum.ak47:
        return 8;
      default:
        return null;
    }
  }
}
