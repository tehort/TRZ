import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trz/models/property.dart';

part 'new_items_dialog.viewmodel.g.dart';

class NewItemsDialogViewModel = NewItemsDialogViewModelBase with _$NewItemsDialogViewModel;

abstract class NewItemsDialogViewModelBase with Store {
  NewItemsDialogViewModelBase(List<Property> items) {
    for (final item in items) {
      this.items.add(item);
    }
  }

  @observable
  var dialogItems = <Widget>[];

  @observable
  var items = <Property>[];
}
