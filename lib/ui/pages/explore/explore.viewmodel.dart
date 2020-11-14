import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:trz/core/errors/error_handler.dart';
import 'package:trz/services/people.service.dart';
import 'package:pedantic/pedantic.dart';
import 'package:uuid/uuid.dart';

part 'explore.viewmodel.g.dart';

class ExploreViewModel = ExploreViewModelBase with _$ExploreViewModel;

abstract class ExploreViewModelBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool val) {
    isLoading = val;
  }

  @observable
  Set<Marker> markers = {};

  @action
  Future<void> loadMarkers(BuildContext context) async {
    isLoading = true;
    final service = PeopleService();
    await service.getAllSurvivors().then(
      (lstSurvivors) {
        final tempMarkers = <Marker>{};
        for (final item in lstSurvivors) {
          if (item.lonlat != null) {
            tempMarkers.add(Marker(
              markerId: MarkerId(Uuid().v4()),
              position: LatLng(item.lonlat.latitude, item.lonlat.longitude),
              infoWindow: InfoWindow(
                title: '${item.name}',
                snippet: item.infected ? 'Infectado' : 'Não infectado',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ));

            markers = tempMarkers;
          }
        }
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
