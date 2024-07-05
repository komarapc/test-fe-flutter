import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimsController extends GetxController {
  String? namaPengemudi;
  String? jenisKelamin;
  String? tanggalKejadian;
  TimeOfDay? waktuKejadian;
  String? wilayahProvinsi;
  String? wilayahKota;
  String? wilayahKecamatan;
  String? wilayahKelurahan;

  void setNamaPengemudi(String value) {
    namaPengemudi = value;
    update();
  }

  void setJenisKelamin(String value) {
    jenisKelamin = value;
    update();
  }

  void setTanggalKejadian(String value) {
    tanggalKejadian = value;
    update();
  }

  void setWaktuKejadian(TimeOfDay value) {
    waktuKejadian = value;
    update();
  }

  void setWilayahProvinsi(String value) {
    wilayahProvinsi = value;
    update();
  }

  void setWilayahKota(String value) {
    wilayahKota = value;
    update();
  }

  void setWilayahKecamatan(String value) {
    wilayahKecamatan = value;
    update();
  }

  void setWilayahKelurahan(String value) {
    wilayahKelurahan = value;
    update();
  }

  String getWaktuKejadin() {
    if (waktuKejadian == null) {
      return ''; // or handle the null case as needed
    }
    String waktuJam = waktuKejadian!.hour.toString();
    String waktuMenit = waktuKejadian!.minute.toString();
    return '$waktuJam:$waktuMenit';
  }
}
