import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:kaku/components/coustom_bottom_nav_bar.dart';
import 'package:kaku/enums.dart';

import 'components/body.dart';

class ScanScreen extends StatelessWidget {
  static String routeName = "/scan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRCodeScannerScreen(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.scan),
    );
  }
}
