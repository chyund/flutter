import 'dart:io';
import 'dart:async';

import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:permission_handler/permission_handler.dart';

import 'model/device_model.dart';

class DevicesBloc {
  final List<BleDevice> bleDevices = <BleDevice>[];
  BleManager _bleManager;
  DevicesBloc(this._bleManager);

  PermissionStatus _locationPermissionStatus = PermissionStatus.unknown;
  StreamSubscription<ScanResult> _scanSubscription;
  //BehaviorSubject<List<BleDevice>> _visibleDevicesController = BehaviorSubject<List<BleDevice>>.seeded(<BleDevice>[]);


  void init(){
    _bleManager.createClient()
        .catchError((e) => print("can't use ble"))
        .then((_) => _checkPermissions())
        .catchError((e) => print("Permission check error"))
        .then((_) => _waitForBluetoothPoweredOn())
        .then((_) => _startScan());
  }

  Future<void> _checkPermissions() async {
    if (Platform.isAndroid) {
      var permissionStatus = await PermissionHandler()
          .requestPermissions([PermissionGroup.location]);

      _locationPermissionStatus = permissionStatus[PermissionGroup.location];

      if (_locationPermissionStatus != PermissionStatus.granted) {
        return Future.error(Exception("Location permission not granted"));
      }
    }
  }

  Future<void> _waitForBluetoothPoweredOn() async {
    Completer completer = Completer();
    StreamSubscription<BluetoothState> subscription;
    subscription = _bleManager
        .observeBluetoothState(emitCurrentValue: true)
        .listen((bluetoothState) async {
      if (bluetoothState == BluetoothState.POWERED_ON &&
          !completer.isCompleted) {
        await subscription.cancel();
        completer.complete();
      }
    });
    return completer.future;
  }


  void _startScan() {
    print("Ble client created");
    _scanSubscription =
        _bleManager.startPeripheralScan().listen((ScanResult scanResult) {
          var bleDevice = BleDevice(scanResult);
          if (scanResult.advertisementData.localName != null &&
              !bleDevices.contains(bleDevice)) {
            print('found new device ${scanResult.advertisementData.localName} ${scanResult.peripheral.identifier}');
            bleDevices.add(bleDevice);
            //_visibleDevicesController.add(bleDevices.sublist(0));
          }
        });
  }

  void onDestroy(){
    _bleManager.stopPeripheralScan();
    _bleManager.destroyClient();
  }
}