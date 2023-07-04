import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:kaku/constants.dart';
import 'package:kaku/screens/home/home_screen.dart';
import 'package:kaku/screens/otp/otp_screen.dart';
import 'package:kaku/screens/pesan/pesan_screen.dart';
import 'package:kaku/screens/scan/controllers/scan.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  late CameraController _cameraController;
  late QRViewController _qrViewController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  List<CameraDescription> camera = [];

  bool _isZoomEnabled = false;
  bool _isFlashEnabled = false;
  bool _isFrontCamera = false;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _zoomLevel = 1.0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    camera = await availableCameras();
    _cameraController = CameraController(camera[0], ResolutionPreset.max);
    await _cameraController.initialize();

    setState(() {});
  }

  void _toggleFlash() {
    setState(() {
      _isFlashEnabled = !_isFlashEnabled;
      _cameraController
          .setFlashMode(_isFlashEnabled ? FlashMode.torch : FlashMode.off);
    });
  }

  void _toggleCamera() {
    setState(() {
      _isFrontCamera = !_isFrontCamera;
      final cameraIndex = _isFrontCamera ? 1 : 0;
      _cameraController =
          CameraController(camera[cameraIndex], ResolutionPreset.max);
      _cameraController.initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    });
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      // Tindakan yang dijalankan ketika QR code terdeteksi
      setState(() async {
        if (pesanValidatorRegExp.hasMatch(scanData.code.toString())) {
          bool status = await pesanGet(scanData.code.toString());
          if (status) {
            dispose();
            Navigator.pushNamed(context, PesanScreen.routeName);
          }
        }
      });
    });
  }

  void _zoomIn() {
    _cameraController
        .getMaxZoomLevel()
        .then((value) => _maxAvailableZoom = value);
    setState(() {
      if (_zoomLevel < _maxAvailableZoom) {
        _zoomLevel += 0.1;
        _cameraController.setZoomLevel(_zoomLevel);
      }
    });
  }

  void _zoomOut() {
    _cameraController
        .getMinZoomLevel()
        .then((value) => _minAvailableZoom = value);
    setState(() {
      if (_zoomLevel > _minAvailableZoom) {
        _zoomLevel -= 0.1;
        _cameraController.setZoomLevel(_zoomLevel);
      }
    });
  }

  @override
  void dispose() {
    _qrViewController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null || !_cameraController.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                CameraPreview(_cameraController),
                QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 30,
                    borderWidth: 10,
                    cutOutSize: 300,
                  ),
                ),
              ],
            ),
            // ),
            // Expanded(
            //   flex: 1,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text('Zoom:'),
            //       IconButton(
            //         icon: Icon(Icons.zoom_in),
            //         onPressed: _zoomIn,
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.zoom_out),
            //         onPressed: _zoomOut,
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.flash_on),
            //         onPressed: _toggleFlash,
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.flip_camera_ios),
            //         onPressed: _toggleCamera,
            //       ),
            //     ],
            //   ),
          ),
        ],
      ),
    );
  }
}
