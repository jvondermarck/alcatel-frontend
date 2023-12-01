import 'dart:io';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:pushtotalk/interfaces/bluetooth.dart';

class BluetoothImpl implements Bluetooth {
  @override
  Future<bool> enableBLE() async {
    // check if BLE is supported
    if (await FlutterBluePlus.isSupported == false) {
      print("BLE is not supported by this device!");
      return false;
    }

    // turn on bluetooth ourself if we can
    // for iOS, the user controls bluetooth enable/disable
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

    // wait bluetooth to be on
    // note: for iOS the initial state is typically BluetoothAdapterState.unknown
    await FlutterBluePlus.adapterState
        .where((s) => s == BluetoothAdapterState.on)
        .first;
    return false;
  }

  @override
  startScan() async {
    FlutterBluePlus.startScan(); //Starts Scanning for Devices
    // Put scan results in a list
    List<ScanResult> scanResults = [];
    // Listen for scan results
    FlutterBluePlus.scanResults.listen((results) {
      // Add scan results to list
      for (ScanResult r in results) {
        scanResults.add(r);
      }
    });
    // Wait for scan to finish
    await Future.delayed(const Duration(seconds: 4));
    // Stop scan
    stopScan();
    // Remove duplicates from the list
    scanResults = scanResults.toSet().toList();
    // Sort the list by RSSI
    scanResults.sort((a, b) => b.rssi.compareTo(a.rssi));
    // Print scan results
    for (ScanResult r in scanResults) {
      print('${r.device.remoteId} found! rssi: ${r.rssi}');
    }
  }

  @override
  stopScan() async {
    FlutterBluePlus.stopScan(); //Stop Scanning for Devices
  }
}
