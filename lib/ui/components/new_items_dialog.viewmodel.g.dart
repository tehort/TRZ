// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_items_dialog.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewItemsDialogViewModel on NewItemsDialogViewModelBase, Store {
  final _$dialogItemsAtom =
      Atom(name: 'NewItemsDialogViewModelBase.dialogItems');

  @override
  List<Widget> get dialogItems {
    _$dialogItemsAtom.reportRead();
    return super.dialogItems;
  }

  @override
  set dialogItems(List<Widget> value) {
    _$dialogItemsAtom.reportWrite(value, super.dialogItems, () {
      super.dialogItems = value;
    });
  }

  final _$itemsAtom = Atom(name: 'NewItemsDialogViewModelBase.items');

  @override
  List<Property> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Property> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  @override
  String toString() {
    return '''
dialogItems: ${dialogItems},
items: ${items}
    ''';
  }
}
