// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on HomeViewModelBase, Store {
  final _$activeTabIndexAtom = Atom(name: 'HomeViewModelBase.activeTabIndex');

  @override
  int get activeTabIndex {
    _$activeTabIndexAtom.reportRead();
    return super.activeTabIndex;
  }

  @override
  set activeTabIndex(int value) {
    _$activeTabIndexAtom.reportWrite(value, super.activeTabIndex, () {
      super.activeTabIndex = value;
    });
  }

  final _$previousTabIndexAtom =
      Atom(name: 'HomeViewModelBase.previousTabIndex');

  @override
  int get previousTabIndex {
    _$previousTabIndexAtom.reportRead();
    return super.previousTabIndex;
  }

  @override
  set previousTabIndex(int value) {
    _$previousTabIndexAtom.reportWrite(value, super.previousTabIndex, () {
      super.previousTabIndex = value;
    });
  }

  final _$HomeViewModelBaseActionController =
      ActionController(name: 'HomeViewModelBase');

  @override
  void setTabIndex(int index) {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
        name: 'HomeViewModelBase.setTabIndex');
    try {
      return super.setTabIndex(index);
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeTabIndex: ${activeTabIndex},
previousTabIndex: ${previousTabIndex}
    ''';
  }
}
