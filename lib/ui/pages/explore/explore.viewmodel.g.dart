// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore.viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExploreViewModel on ExploreViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: 'ExploreViewModelBase.isLoading');

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

  final _$markersAtom = Atom(name: 'ExploreViewModelBase.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$loadMarkersAsyncAction =
      AsyncAction('ExploreViewModelBase.loadMarkers');

  @override
  Future<void> loadMarkers(BuildContext context) {
    return _$loadMarkersAsyncAction.run(() => super.loadMarkers(context));
  }

  final _$ExploreViewModelBaseActionController =
      ActionController(name: 'ExploreViewModelBase');

  @override
  void setLoading(bool val) {
    final _$actionInfo = _$ExploreViewModelBaseActionController.startAction(
        name: 'ExploreViewModelBase.setLoading');
    try {
      return super.setLoading(val);
    } finally {
      _$ExploreViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
markers: ${markers}
    ''';
  }
}
