import 'package:get/get.dart';
import 'package:test_fe_flutter/model/foto_kerusakan.dart';

class FotoKerusakanController extends GetxController {
  final List<ModelFotoKerusakan> listFotoKerusakan = [
    ModelFotoKerusakan(
        filePath: 'assets/img/kerusakan_1.jpeg',
        fileSize: '102 Kb',
        fileName: 'Kerusakan 1'),
    ModelFotoKerusakan(
        filePath: 'assets/img/kerusakan_2.jpeg',
        fileSize: '122 Kb',
        fileName: 'Kerusakan 2'),
  ];
}
