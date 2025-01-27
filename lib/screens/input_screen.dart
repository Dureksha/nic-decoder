import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_decoder_controller.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController nicController = TextEditingController();
  final NICDecoderController decoderController =
      Get.put(NICDecoderController());

  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NIC Decoder')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nicController,
              decoration: InputDecoration(
                labelText: 'Enter NIC Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String nic = nicController.text.trim();
                if (nic.isNotEmpty) {
                  decoderController.decodeNIC(nic);
                  Get.toNamed('/result');
                } else {
                  Get.snackbar('Error', 'Please enter a valid NIC');
                }
              },
              child: Text('Decode NIC'),
            ),
          ],
        ),
      ),
    );
  }
}
