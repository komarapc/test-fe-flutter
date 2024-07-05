import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fe_flutter/controller/claims_controller.dart';
import 'package:test_fe_flutter/controller/data_kendaraan.dart';
import 'package:test_fe_flutter/model/wilayah.dart';
import 'package:test_fe_flutter/utils/format_date.dart';
import 'package:test_fe_flutter/views/sample_image_picker.dart';
import 'views/claim_form.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klaim Kerusakan Kendaraan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Klaim Registrasi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String svgFormPaper = 'assets/svg/jam--newspaper-f.svg';
  final String svgIdCard = 'assets/svg/fa6-solid--id-card.svg';
  final String noPlatKendaraan = 'B 1235 EFG';
  final dataKendaraan = Get.put(DataKendaraanController());
  final claimsController = Get.put(ClaimsController());

  final List<WilayahProvinsi> listProvinsi = [
    WilayahProvinsi(value: 'Sumatera Selatan'),
  ];

  final List<SubWilayah> listKabKota = [
    SubWilayah(parent: 'Sumatera Selatan', value: 'Palembang'),
    SubWilayah(parent: 'Sumatera Selatan', value: 'Lahat'),
    SubWilayah(parent: 'Sumatera Selatan', value: 'Prabumulih'),
  ];

  final List<SubWilayah> listKecamatan = [
    SubWilayah(parent: 'Palembang', value: 'Ilir Barat I'),
    SubWilayah(parent: 'Palembang', value: 'Ilir Barat II'),
    SubWilayah(parent: 'Palembang', value: 'Ilir Timur I'),
    SubWilayah(parent: 'Palembang', value: 'Ilir Timur II'),
  ];

  final List<SubWilayah> listKelurahan = [
    SubWilayah(parent: 'Ilir Barat I', value: 'Kambang Iwak'),
    SubWilayah(parent: 'Ilir Barat I', value: 'Kambang Iwak 2'),
    SubWilayah(parent: 'Ilir Barat I', value: 'Kambang Iwak 3'),
    SubWilayah(parent: 'Ilir Barat I', value: 'Kambang Iwak 4'),
  ];

  // this not appropriate for production
  // do not store api key in the code
  final String apiKey =
      '2b21e1a5a9306dc852ee93000f145d2423b528a7a2fc62e4cfc6095d57dabbd8';
  final String endPointWilayah = 'https://api.binderbyte.com/wilayah/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Card.outlined(
                    color: Colors.green.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.green.shade100,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        svgFormPaper,
                        width: 32,
                        height: 32,
                        colorFilter: ColorFilter.mode(
                          Colors.green.shade500,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Form Klaim',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Isi data diri dan kendaraan',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    noPlatKendaraan,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        wordSpacing: -3),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Data Kendaraan',
                      textAlign: TextAlign.left,
                      style: TextStyle(),
                    ),
                  ),
                  Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Expanded(
                                child: Text('No. Polisi'),
                              ),
                              Text(
                                dataKendaraan.noPlatKendaraan,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // create loop for data kendaraan
                          for (var item in dataKendaraan.dataKendaraan)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.label,
                                        style: TextStyle(
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      item.value,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Card.outlined(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Nama Pengemudi',
                              labelText: "Nama Pengemudi",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: OutlinedButton(
                              child: const Text('Laki - Laki'),
                              onPressed: () => {},
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              child: const Text('Perempuan'),
                              onPressed: () => {},
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 24),

                      // add date picker here
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    final selectedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (selectedDate != null) {
                                      setState(() {
                                        claimsController.tanggalKejadian =
                                            selectedDate.toString();
                                      });

                                      debugPrint(
                                          selectedDate.toIso8601String());
                                    }
                                  },
                                  child: const Text('Tanggal Kejadian'),
                                ),
                                Text(
                                  claimsController.tanggalKejadian != null
                                      ? formatDate(claimsController
                                          .tanggalKejadian
                                          .toString())
                                      : '',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    final selectedTime = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    );
                                    if (selectedTime != null) {
                                      setState(() {
                                        claimsController.waktuKejadian =
                                            selectedTime;
                                      });
                                      debugPrint(selectedTime.toString());
                                    }
                                  },
                                  child: const Text('Waktu Kejadian'),
                                ),
                                Text(claimsController.getWaktuKejadin())
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // BottomSeet
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  showDragHandle: true,
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 800,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            children: [
                              CustomDropdown.search(
                                items: listProvinsi
                                    .map((e) => e.value.toString())
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    claimsController.wilayahProvinsi = value;
                                  });
                                },
                                hintText: 'Pilih Provinsi',
                              ),
                              const SizedBox(height: 16),
                              // add search dropdown for kabupaten kota based on provinsi
                              CustomDropdown.search(
                                items: listKabKota
                                    .map((e) => e.value.toString())
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    claimsController.wilayahKota = value;
                                  });
                                },
                                hintText: 'Pilih Kabupaten/Kota',
                              ),
                              const SizedBox(height: 16),
                              // add search dropdown for kecamatan based on kabupaten kota
                              CustomDropdown.search(
                                items: listKecamatan
                                    .map((e) => e.value.toString())
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    claimsController.wilayahKecamatan = value;
                                  });
                                },
                                hintText: 'Pilih Kecamatan',
                              ),
                              const SizedBox(height: 16),
                              // add search dropdown for kelurahan based on kecamatan
                              CustomDropdown.search(
                                items: listKelurahan
                                    .map((e) => e.value.toString())
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    claimsController.wilayahKelurahan = value;
                                  });
                                },
                                hintText: 'Pilih Kelurahan',
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Lokaasi Kejadian'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ClaimFormPages(),
                  ),
                );
              },
              child: const Text('Lanjut'),
            ),
            const SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => const SampleImagePicker(),
            //       ),
            //     );
            //   },
            //   child: const Text('Goto Sample Imag Picker'),
            // )
          ],
        ),
      ),
    );
  }
}
