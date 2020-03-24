import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_ncovi/views/singin/LoginScreen.dart';
import 'package:permission_handler/permission_handler.dart';

class SplatScreen extends StatefulWidget {
  // Create routeName use navigation screen
  static const routeName = '/splat-screen';

  @override
  _SplatScreenState createState() => _SplatScreenState();
}

class _SplatScreenState extends State<SplatScreen> {
  // Create _status use save status Permission
  PermissionStatus _status;

  @override
  void initState() {
    super.initState();
    // Check and update permission when click dialog permission
    PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationWhenInUse)
        .then(_updateStatus);
    // show dalog permission when used not accept permission
    _askPermission();
  }

  @override
  Widget build(BuildContext context) {
    // Get width - height of device
    final width = MediaQuery.of(context).size.width / 414;
    final height = MediaQuery.of(context).size.height / 896;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo_boyte.png",
                        fit: BoxFit.cover,
                        width: 80 * width,
                        height: 80 * width,
                      ),
                      SizedBox(width: 20 * width),
                      Image.asset(
                        "assets/images/logo_bothongtinvatruyenthong.png",
                        fit: BoxFit.cover,
                        width: 80 * width,
                        height: 80 * width,
                      )
                    ],
                  ),
                  SizedBox(height: 30 * width),
                  CupertinoActivityIndicator()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Func update status when used click option dialog permission
  void _updateStatus(PermissionStatus status) {
    if (status != _status) {
      setState(() {
        _status = status;
      });
    }
  }

  // Show dialog question permission
  void _askPermission() {
    PermissionHandler().requestPermissions(
        [PermissionGroup.locationWhenInUse]).then(_onStatusRequest);
  }

  // Request permission and check request permission on system
  void _onStatusRequest(Map<PermissionGroup, PermissionStatus> statuses) {
    final status = statuses[PermissionGroup.locationWhenInUse];
    if (status != PermissionStatus.granted) {
      PermissionHandler().openAppSettings();
    } else {
      _updateStatus(status);
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    }
  }
}
