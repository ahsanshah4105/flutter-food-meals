import 'package:get/get.dart';
import '../../../core/utils/enums/connectivity_status.dart';
import '../repository/connectivity_repository.dart';

class ConnectivityController extends GetxController {
  final ConnectivityRepository connectivityRepository;

  ConnectivityController({required this.connectivityRepository});
  var status = ConnectivityStatus.Offline.obs;

  @override
  void onInit() {
    super.onInit();
    connectivityRepository.onStatusChange.listen((newStatus) {
      status.value = newStatus;
    });

    connectivityRepository.getCurrentStatus().then((status) {
      print("Current status: $status");
    });
  }
}
