import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/core/errors/error_handler.dart';
import 'package:trz/models/person.dart';
import 'package:trz/services/people.service.dart';
import 'package:trz/services/user_data.service.dart';
import 'package:trz/ui/pages/contacts/display_code.page.dart';
import 'package:pedantic/pedantic.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:validators/validators.dart';

part 'contacts.viewmodel.g.dart';

class ContactsViewModel = ContactsViewModelBase with _$ContactsViewModel;

abstract class ContactsViewModelBase with Store {
  // Loading widget
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool val) {
    isLoading = val;
  }

  @observable
  List<Person> contacts = <Person>[];

  @action
  void displayQrCode(BuildContext context) {
    unawaited(
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DisplayQrCode()),
      ),
    );
  }

  @action
  Future<void> loadContacts(BuildContext context) async {
    final myContacts = <Person>[];
    final storedContacts = await inject<UserDataService>().getContacts();

    isLoading = true;
    await PeopleService().getAllSurvivors().then(
      (val) {
        for (final item in val) {
          int index;
          try {
            index = storedContacts.indexOf(item.location.split('/').last);
          } catch (e) {
            continue;
          }
          if (index >= 0) {
            item.id = item.location.split('/').last;
            myContacts.add(item);
          }
        }
        contacts = myContacts;
      },
    ).catchError(
      (e) async {
        unawaited(ErrorHandler.handleError(e, context));
      },
    ).whenComplete(
      () {
        isLoading = false;
      },
    );
  }

  @action
  Future<void> flagSurvivor(BuildContext context, String id) async {}

  @action
  Future<void> scanQrCode(BuildContext context) async {
    final cameraScanResult = await scanner.scan();
    if (!isNull(cameraScanResult) || cameraScanResult.isNotEmpty) {
      inject<UserDataService>().addContact(cameraScanResult);
      await loadContacts(context);
    }
  }
}
