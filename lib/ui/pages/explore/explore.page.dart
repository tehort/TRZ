import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trz/core/dependency_injection/dependency_injection.dart';
import 'package:trz/ui/widgets/progress_hud.dart';
import 'explore.viewmodel.dart';
import 'package:pedantic/pedantic.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  var vm = inject<ExploreViewModel>();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () async {
        unawaited(vm.loadMarkers(context));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
      ),
      body: Stack(
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

  final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _myLocation = CameraPosition(target: LatLng(0, 0));

  Widget buildBody() {
    return Observer(
      builder: (BuildContext context) {
        return GoogleMap(
          initialCameraPosition: _myLocation,
          // markers: markers = {Marker(markerId: Guid)},
          markers: vm.markers,
          mapType: MapType.hybrid,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        );
      },
    );
  }
}
