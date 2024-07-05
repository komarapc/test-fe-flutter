import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fe_flutter/controller/claims_controller.dart';
import 'package:test_fe_flutter/controller/data_kendaraan.dart';
import 'package:test_fe_flutter/controller/foto_kerusakan.dart';
import 'package:test_fe_flutter/utils/format_date.dart';

class PreviewDataPostPage extends StatefulWidget {
  const PreviewDataPostPage({super.key});

  @override
  State<PreviewDataPostPage> createState() => _PreviewDataPostPageState();
}

class _PreviewDataPostPageState extends State<PreviewDataPostPage> {
  final dataKendaraan = Get.put(DataKendaraanController());
  final claimKendaraan = Get.put(ClaimsController());
  final fotoKerusakan = Get.put(FotoKerusakanController());

  Map<String, dynamic> get dataPost => {
        'no_polisi': dataKendaraan.noPlatKendaraan,
        'nama_pengemudi': claimKendaraan.namaPengemudi,
        'lokasi_kejadian': {
          'provinsi': claimKendaraan.wilayahProvinsi,
          'kota': claimKendaraan.wilayahKota,
          'kecamatan': claimKendaraan.wilayahKecamatan,
          'kelurahan': claimKendaraan.wilayahKelurahan,
        },
        'waktu_kejadian': {
          'tanggal_kejadian': claimKendaraan.tanggalKejadian != null
              ? formatDate(claimKendaraan.tanggalKejadian.toString())
              : '',
          'waktu': claimKendaraan.getWaktuKejadin()
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview Data Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(jsonEncode(dataPost)),
      ),
    );
  }
}
