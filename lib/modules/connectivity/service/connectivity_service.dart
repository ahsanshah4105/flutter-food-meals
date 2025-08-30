
import '../../../core/utils/enums/connectivity_status.dart';

abstract class ConnectivityService {
  Stream<ConnectivityStatus> get onStatusChange;
  Future<ConnectivityStatus> getCurrentStatus();
}
