import 'dart:async';
import 'dart:io';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:permission_handler/permission_handler.dart';
import 'model/device_model.dart';

class DevicesListScreen extends StatefulWidget {
  @override
  State<DevicesListScreen> createState() => DeviceListScreenState();
}

class DeviceListScreenState extends State<DevicesListScreen> {
  BleManager _bleManager;
  List<BleDevice> bleDevices = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bleManager = BleManager();
  }

  Future<void> _checkPermissions() async {
    Fimber.d("_checkPermissions");
    if (Platform.isAndroid) {
      var permissionStatus = await PermissionHandler()
          .requestPermissions([PermissionGroup.location]);

      if (permissionStatus[PermissionGroup.location] != PermissionStatus.granted) {
        return Future.error(Exception("Location permission not granted"));
      }
    }
  }

  Future<void> _waitForBluetoothPoweredOn() async {
    Fimber.d("_waitForBluetoothPoweredOn");
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
    Fimber.d("Ble client created");
    _bleManager.startPeripheralScan().listen((ScanResult scanResult) {
      var bleDevice = BleDevice(scanResult);
      if (scanResult.advertisementData.localName != null && !bleDevices.contains(bleDevice)){
        setState((){
          bleDevices.add(bleDevice);
          bleDevices.sort((a,b) => a.rssi-b.rssi);
        });
      }
    });

  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    Fimber.d("-------------didChangeDependencies------------------");
    init();
    Fimber.d("after didChangeDependencies");
  }

  void init(){
    _bleManager.createClient().then((value) => _checkPermissions())
        .catchError((e) => print("Permission check error"))
        .then((value) => _waitForBluetoothPoweredOn())
        .then((_) => _startScan());
  }

  @override
  void dispose() {
    // TODO: implement deactivate
    super.dispose();
    _bleManager.stopPeripheralScan().then((value) => _bleManager.destroyClient());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth devices'),
      ),
      body: ListView.separated(itemBuilder: (BuildContext context, int index){
        BleDevice device = bleDevices[index];
        return ListTile(
          title: Text("${device.name}"),
          subtitle: Text("${device.peripheral.identifier}"),
          trailing: Text("${device.rssi}"),
        );
      },
          separatorBuilder: (BuildContext context, int index){return Divider();},
          itemCount: bleDevices.length)
    );
  }

}

