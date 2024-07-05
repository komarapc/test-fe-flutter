import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:test_fe_flutter/controller/claims_controller.dart';
import 'package:test_fe_flutter/controller/data_kendaraan.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_fe_flutter/views/foto_kerusakan.dart';

class ClaimFormPages extends StatefulWidget {
  const ClaimFormPages({super.key});
  final String title = 'Klaim Registrasi';

  @override
  State<ClaimFormPages> createState() => _ClaimFormPagesState();
}

class _ClaimFormPagesState extends State<ClaimFormPages> {
  final claimsController = Get.put(ClaimsController());
  final dataKendaraan = Get.put(DataKendaraanController());
  final String svgIdCard = 'assets/svg/fa6-solid--id-card.svg';
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                          svgIdCard,
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
                            'SIM & STNK',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'Upload Foto SIM & STNK',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      dataKendaraan.noPlatKendaraan,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          wordSpacing: -3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Card.filled(
                color: Colors.green.shade50.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.green.shade100,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Nama Tertanggung',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      dataKendaraan.getDataFromFieldLabel(
                                          'Nama Tertanggung'),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'No. Polis',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      dataKendaraan
                                          .getDataFromFieldLabel('No. Polis'),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Foto SIM'),

                        // import assets image
                        Image.asset('assets/img/sim.jpg'),
                        const Text(
                          '*Data pada SIM harus terlihat jelas',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Foto STNK'),
                        Card.outlined(
                            child: SizedBox(
                          height: 120,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton.filledTonal(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {},
                                ),
                                const Text(
                                  'Upload Foto STNK',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                        // import assets image
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Foto KTP Tertanggung'),
                        Card.outlined(
                          child: SizedBox(
                            height: 120,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton.filledTonal(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {},
                                  ),
                                  const Text(
                                    'Upload Foto KTP',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        // import assets image
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FotoKerusakanPage(),
                          ),
                        );
                      },
                      child: const Text('Lanjut'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
