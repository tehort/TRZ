import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trz/models/property.dart';
import 'package:trz/ui/components/new_items_dialog.viewmodel.dart';

class NewItemsDialog {
  NewItemsDialog() {
    populateList();
  }

  var vm = NewItemsDialogViewModel(Property.itemsList());

  Widget alertDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Pick your items:'),
      contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      content: Container(
        width: 100,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[for (var item in vm.dialogItems) item],
        ),
      ),
      actions: [
        FlatButton(
          onPressed: () => Navigator.pop(context, Property.toApiFormat(vm.items)),
          child: Text('Ok'),
        ),
      ],
    );
  }

  void populateList() {
    for (final item in vm.items) {
      vm.dialogItems.add(
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: double.infinity,
                      child: Text('${item.item.name}'),
                    ),
                  ),
                  quantityDropdown(vm.items.indexOf(item)),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget quantityDropdown(int index) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: DropdownButtonFormField<int>(
          value: vm.items[index].quantity,
          onChanged: (value) => vm.items[index].quantity = value,
          items: [for (var i = 0; i < 10; i += 1) i].map(
            (int val) {
              return DropdownMenuItem<int>(
                value: val,
                child: Text('$val'),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
