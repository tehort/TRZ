// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on LoginViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: 'LoginViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$nameAtom = Atom(name: 'LoginViewModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$ageAtom = Atom(name: 'LoginViewModelBase.age');

  @override
  int get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  final _$genderAtom = Atom(name: 'LoginViewModelBase.gender');

  @override
  Gender get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(Gender value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$gpsPositionStreamAtom =
      Atom(name: 'LoginViewModelBase.gpsPositionStream');

  @override
  StreamSubscription<Position> get gpsPositionStream {
    _$gpsPositionStreamAtom.reportRead();
    return super.gpsPositionStream;
  }

  @override
  set gpsPositionStream(StreamSubscription<Position> value) {
    _$gpsPositionStreamAtom.reportWrite(value, super.gpsPositionStream, () {
      super.gpsPositionStream = value;
    });
  }

  final _$itemsAtom = Atom(name: 'LoginViewModelBase.items');

  @override
  String get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(String value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$validateAndRegisterAsyncAction =
      AsyncAction('LoginViewModelBase.validateAndRegister');

  @override
  Future<void> validateAndRegister(BuildContext context) {
    return _$validateAndRegisterAsyncAction
        .run(() => super.validateAndRegister(context));
  }

  final _$logSurvivorInAsyncAction =
      AsyncAction('LoginViewModelBase.logSurvivorIn');

  @override
  Future<void> logSurvivorIn(String id, BuildContext context) {
    return _$logSurvivorInAsyncAction
        .run(() => super.logSurvivorIn(id, context));
  }

  final _$LoginViewModelBaseActionController =
      ActionController(name: 'LoginViewModelBase');

  @override
  void setLoading(bool val) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.setLoading');
    try {
      return super.setLoading(val);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String val) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.validateName');
    try {
      return super.validateName(val);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateAge(int val) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.validateAge');
    try {
      return super.validateAge(val);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateGender(Gender val) {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
        name: 'LoginViewModelBase.validateGender');
    try {
      return super.validateGender(val);
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
name: ${name},
age: ${age},
gender: ${gender},
gpsPositionStream: ${gpsPositionStream},
items: ${items}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  final _$nameAtom = Atom(name: '_FormErrorState.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$ageAtom = Atom(name: '_FormErrorState.age');

  @override
  String get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(String value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  final _$genderAtom = Atom(name: '_FormErrorState.gender');

  @override
  String get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(String value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
age: ${age},
gender: ${gender},
hasErrors: ${hasErrors}
    ''';
  }
}
