abstract class Bluetooth {
  Future<bool> enableBLE();
  Future<void> startScan();
  Future<void> stopScan();
}
