import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/core/errors/error_handler.dart';
import 'package:trz/models/enums/gender.dart';
import 'package:trz/models/person.dart';
import 'package:trz/models/session.dart';
import 'package:trz/services/people.service.dart';
import 'package:trz/services/user_data.service.dart';
import 'package:trz/ui/pages/home/home.page.dart';
import 'package:validators/validators.dart';
import 'package:pedantic/pedantic.dart';

part 'login.viewmodel.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  LoginViewModelBase() {
    WidgetsFlutterBinding.ensureInitialized();
    // fires up GPS tracking
    gpsPositionStream = Geolocator.getPositionStream().listen(
      (Position position) {
        positionFieldController.text = 'Lat: ${position.latitude.toStringAsFixed(6)} Lon: ${position.longitude.toStringAsFixed(6)}';
        gpsPosition = LatLng(position.latitude, position.longitude);
      },
    );
  }

  // Loading widget
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool val) {
    isLoading = val;
  }

  // Input and Forms Validation
  final FormErrorState errors = FormErrorState();
  var positionFieldController = TextEditingController(text: 'Location not available');

  @observable
  String name;

  @observable
  int age;

  @observable
  Gender gender;

  @observable
  StreamSubscription<Position> gpsPositionStream;
  LatLng gpsPosition;

  @observable
  String items = 'Fiji Water:0;Campbell Soup:0;First Aid Pouch:0;AK47:0';

  // Validations
  @action
  void validateName(String val) {
    errors.name = isNull(val) || val.isEmpty ? 'Enter your Name' : null;
  }

  @action
  void validateAge(int val) {
    errors.age = val == null ? 'Select your Age' : null;
  }

  @action
  void validateGender(Gender val) {
    errors.gender = val == null ? 'Select your Gender' : null;
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => name, validateName),
      reaction((_) => age, validateAge),
      reaction((_) => gender, validateGender),
    ];
  }

  // Dispose
  List<ReactionDisposer> _disposers;

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  // other events
  @action
  Future<void> validateAndRegister(BuildContext context) async {
    validateName(name);
    validateAge(age);
    validateGender(gender);

    if (!errors.hasErrors) {
      isLoading = true;
      final service = PeopleService();
      await service.registerSurvivor(Person(age: age, gender: gender, name: name, lonlat: gpsPosition), items).then(
        (val) {
          inject<UserDataService>().setUUID(val.id);
          logSurvivorIn(val.id, context);
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
  }

  @action
  Future<void> logSurvivorIn(String id, BuildContext context) async {
    isLoading = true;
    await PeopleService().getSurvivor(id).then(
      (val) {
        inject<Session>().person = val;
        unawaited(
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (_) => false,
          ),
        );
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
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String name, age, gender;

  @computed
  bool get hasErrors => name != null || age != null || gender != null;
}
