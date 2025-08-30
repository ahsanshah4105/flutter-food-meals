import 'dart:async';

import '../../../core/utils/enums/connectivity_status.dart';
import '../service/connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectivityRepository implements ConnectivityService {
  final StreamController<ConnectivityStatus> _connectionStatusController =
  StreamController<ConnectivityStatus>.broadcast();

  ConnectivityRepository() {
    _listenToConnectivityChanges();
  }

  void _listenToConnectivityChanges() {
    Connectivity().onConnectivityChanged.listen((results) {
      final result =
      results.isNotEmpty ? results.first : ConnectivityResult.none;
      final status = _mapResultToStatus(result);
      _connectionStatusController.add(status);
    });
  }

  ConnectivityStatus _mapResultToStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.Wifi;
      case ConnectivityResult.none:
      default:
        return ConnectivityStatus.Offline;
    }
  }

  @override
  Future<ConnectivityStatus> getCurrentStatus() async {
    final results = await Connectivity().checkConnectivity();
    final result =
    results.isNotEmpty ? results.first : ConnectivityResult.none;
    return _mapResultToStatus(result);
  }

  @override
  Stream<ConnectivityStatus> get onStatusChange =>
      _connectionStatusController.stream;


  void dispose() {
    _connectionStatusController.close();
  }
}
