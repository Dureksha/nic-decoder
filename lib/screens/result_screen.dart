import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_decoder_controller.dart';

// ignore: use_key_in_widget_constructors
class ResultScreen extends StatelessWidget {
  final NICDecoderController decoderController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Decoded NIC Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date of Birth: ${decoderController.dob}',
                style: TextStyle(fontSize: 18)),
            Text('Gender: ${decoderController.gender}',
                style: TextStyle(fontSize: 18)),
            Text('Weekday: ${decoderController.weekday}',
                style: TextStyle(fontSize: 18)),
            Text('Age: ${decoderController.age}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Back to Input Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
