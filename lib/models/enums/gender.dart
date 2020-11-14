enum Gender { male, female }

extension GenderExtension on Gender {
  String get description {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      default:
        return null;
    }
  }

  String enumToChar() {
    switch (this) {
      case Gender.male:
        return 'M';
      case Gender.female:
        return 'F';
      default:
        return null;
    }
  }
}
