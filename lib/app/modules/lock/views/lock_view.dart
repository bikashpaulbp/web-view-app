import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lock_controller.dart';

class LockView extends GetView<LockController> {
  const LockView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LockView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LockView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
