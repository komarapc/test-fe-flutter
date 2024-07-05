import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_fe_flutter/controller/data_kendaraan.dart';
import 'package:test_fe_flutter/controller/foto_kerusakan.dart';
import 'package:test_fe_flutter/model/foto_kerusakan.dart';
import 'package:test_fe_flutter/views/preview_data_post.dart';

class FotoKerusakanPage extends StatefulWidget {
  const FotoKerusakanPage({super.key});
  @override
  State<FotoKerusakanPage> createState() => _FotoKerusakanPageState();
}

class _FotoKerusakanPageState extends State<FotoKerusakanPage> {
  final String svgCarCrash = 'assets/svg/car-crash.svg';
  final String svgEdit = 'assets/svg/edit.svg';
  final dataKendaraan = Get.put(DataKendaraanController());
  final dataFotoKerusakan = Get.put(FotoKerusakanController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Foto Kerusakan',
            style: TextStyle(fontSize: 16),
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
                            svgCarCrash,
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
                              'Kerusakan Kendaraan',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              'Upload foto kerusakan kendaraan',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
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
                for (ModelFotoKerusakan fotoKerusakan
                    in dataFotoKerusakan.listFotoKerusakan)
                  Card.outlined(
                    // color: Colors.green.shade50.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.green.shade100,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fotoKerusakan.fileName,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                    Text(
                                      fotoKerusakan.fileSize,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(svgEdit,
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                    Colors.green.shade500,
                                    BlendMode.srcIn,
                                  )),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Image.asset(
                            fotoKerusakan.filePath,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card.outlined(
                      child: SizedBox(
                        height: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton.filledTonal(
                                icon: const Icon(Icons.add),
                                onPressed: () {},
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Upload Foto Kerusakan',
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
                // full elevated button
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PreviewDataPostPage(),
                            ),
                          );
                        },
                        child: const Expanded(
                          child: Text('Simpan'),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
