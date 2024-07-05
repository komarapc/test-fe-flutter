import 'package:get/get.dart';
import 'package:test_fe_flutter/model/data_kendaraan.dart';

class DataKendaraanController extends GetxController {
  final String noPlatKendaraan = 'B 1235 EFG';
  final List<ModelDataKendaraan> dataKendaraan = [
    ModelDataKendaraan(label: 'Nama Tertanggung', value: 'Fajar Saputra'),
    ModelDataKendaraan(label: 'No. Polis', value: 'VCL2007001'),
    ModelDataKendaraan(label: 'Periode', value: '1 Juli 2020 - 30 Juni 2021'),
    ModelDataKendaraan(
        label: 'Nilai Pertanggungan', value: ' Rp 100.000.000,-'),
    ModelDataKendaraan(label: 'Buatan/Merk', value: 'Jepang/Honda'),
    ModelDataKendaraan(label: 'Tahun Pembuatan', value: '2019'),
    ModelDataKendaraan(label: 'No. Mesin', value: 'MHK-1234567'),
    ModelDataKendaraan(label: 'No. Rangka', value: 'MHK-232'),
  ];

  String getDataFromFieldLabel(String label) {
    return dataKendaraan.firstWhere((element) => element.label == label).value;
  }
}
