// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContactsViewModel on ContactsViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: 'ContactsViewModelBase.isLoading');

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

  final _$contactsAtom = Atom(name: 'ContactsViewModelBase.contacts');

  @override
  List<Person> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(List<Person> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  final _$loadContactsAsyncAction =
      AsyncAction('ContactsViewModelBase.loadContacts');

  @override
  Future<void> loadContacts(BuildContext context) {
    return _$loadContactsAsyncAction.run(() => super.loadContacts(context));
  }

  final _$flagSurvivorAsyncAction =
      AsyncAction('ContactsViewModelBase.flagSurvivor');

  @override
  Future<void> flagSurvivor(BuildContext context, String id) {
    return _$flagSurvivorAsyncAction.run(() => super.flagSurvivor(context, id));
  }

  final _$scanQrCodeAsyncAction =
      AsyncAction('ContactsViewModelBase.scanQrCode');

  @override
  Future<void> scanQrCode(BuildContext context) {
    return _$scanQrCodeAsyncAction.run(() => super.scanQrCode(context));
  }

  final _$ContactsViewModelBaseActionController =
      ActionController(name: 'ContactsViewModelBase');

  @override
  void setLoading(bool val) {
    final _$actionInfo = _$ContactsViewModelBaseActionController.startAction(
        name: 'ContactsViewModelBase.setLoading');
    try {
      return super.setLoading(val);
    } finally {
      _$ContactsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void displayQrCode(BuildContext context) {
    final _$actionInfo = _$ContactsViewModelBaseActionController.startAction(
        name: 'ContactsViewModelBase.displayQrCode');
    try {
      return super.displayQrCode(context);
    } finally {
      _$ContactsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
contacts: ${contacts}
    ''';
  }
}
