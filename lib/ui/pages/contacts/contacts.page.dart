import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/models/person.dart';
import 'package:trz/ui/pages/contacts/contacts.viewmodel.dart';
import 'package:trz/ui/widgets/progress_hud.dart';
import 'package:pedantic/pedantic.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  var vm = inject<ContactsViewModel>();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () async {
        unawaited(vm.loadContacts(context));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contacts'),
        actions: [
          IconButton(icon: Icon(Icons.camera_alt), onPressed: () => vm.scanQrCode(context)),
          IconButton(icon: Icon(Icons.qr_code), onPressed: () => vm.displayQrCode(context)),
        ],
      ),
      body: Stack(
        // children: buildBody()
        children: [
          buildBody(),
          buildLoading(),
        ],
      ),
    );
  }

  Observer buildLoading() {
    return Observer(
      builder: (_) {
        if (vm.isLoading) {
          return ProgressHud();
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildBody() {
    return Observer(
      builder: (BuildContext context) {
        return vm.contacts.isEmpty
            ? Center(child: Text('You have no contacts'))
            : ListView(
                children: [
                  for (final item in vm.contacts) itemTile(item),
                ],
              );
      },
    );
  }

  ListTile itemTile(Person item) {
    return ListTile(
      title: Text('${item.name}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          OutlinedButton(
            onPressed: () {},
            child: Text('Trade'),
          ),
          VerticalDivider(color: Colors.transparent),
          OutlinedButton(
            onPressed: () {},
            child: Text('Flag'),
          ),
        ],
      ),
    );
  }
}
