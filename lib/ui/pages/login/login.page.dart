import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/models/enums/gender.dart';
import 'package:trz/services/user_data.service.dart';
import 'package:trz/ui/components/new_items_dialog.dart';
import 'package:trz/ui/pages/login/login.viewmodel.dart';
import 'package:trz/ui/widgets/progress_hud.dart';
import 'package:validators/validators.dart';
import 'package:pedantic/pedantic.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var vm = inject<LoginViewModel>();

  @override
  void initState() {
    super.initState();
    vm.setupValidations();

    Future.delayed(
      Duration.zero,
      () async {
        final uuid = await inject<UserDataService>().getUUID();
        if (!isNull(uuid) && uuid.isNotEmpty) {
          unawaited(vm.logSurvivorIn(uuid, context));
        }
      },
    );
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          buildBackground(),
          buildbody(),
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

  Widget buildbody() {
    // the GestureDetector removes focus of input fields when
    // you tap somewhere else in the screen
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        FocusScope.of(context).consumeKeyboardToken();
      },
      behavior: HitTestBehavior.translucent,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              titleLabel(),
              Divider(color: Colors.transparent),
              greetingsLabel(),
              Divider(color: Colors.transparent),
              nameField(),
              genderDropdown(),
              ageDropdown(),
              positionField(),
              Divider(color: Colors.transparent),
              selectItemsButton(),
              Divider(color: Colors.transparent),
              registerButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/login_background.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget titleLabel() {
    return Text(
      'The Resident Zombie',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32),
    );
  }

  Widget greetingsLabel() {
    return Text(
      'Sign up to begin your Journey!',
      style: TextStyle(fontSize: 18),
    );
  }

  Widget nameField() {
    return Observer(
      builder: (_) => TextField(
        onChanged: (value) => vm.name = value,
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Enter your name',
          errorText: vm.errors.name,
        ),
      ),
    );
  }

  Widget genderDropdown() {
    return Observer(
      builder: (_) => DropdownButtonFormField<Gender>(
        value: vm.gender,
        onChanged: (value) => vm.gender = value,
        items: Gender.values.map(
          (Gender val) {
            return DropdownMenuItem<Gender>(
              value: val,
              child: Text(val.description),
            );
          },
        ).toList(),
        decoration: InputDecoration(
          labelText: 'Gender',
          errorText: vm.errors.gender,
        ),
      ),
    );
  }

  Widget ageDropdown() {
    return Observer(
      builder: (_) => DropdownButtonFormField<int>(
        value: vm.age,
        onChanged: (value) => vm.age = value,
        // show only ages ranging from 0 to 130
        items: [for (var i = 0; i < 130; i += 1) i].map(
          (int val) {
            return DropdownMenuItem<int>(
              value: val,
              child: Text('$val'),
            );
          },
        ).toList(),
        decoration: InputDecoration(
          labelText: 'Age',
          errorText: vm.errors.age,
        ),
      ),
    );
  }

  Widget positionField() {
    return Observer(
      builder: (_) => TextField(
        controller: vm.positionFieldController,
        textAlign: TextAlign.center,
        enabled: false,
        decoration: InputDecoration(
          labelText: 'Your Last Known Location',
          errorText: vm.errors.name,
        ),
      ),
    );
  }

  Widget selectItemsButton() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text('Pick here your items!'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return NewItemsDialog().alertDialog(context);
            },
          ).then(
            (val) {
              vm.items = val;
            },
          );
        },
      ),
    );
  }

  Widget registerButton() {
    return Container(
      width: double.infinity,
      // height: 48,
      child: Observer(
        builder: (_) {
          return RaisedButton(
            onPressed: () => vm.validateAndRegister(context),
            child: Text('Register'),
          );
        },
      ),
    );
  }
}
