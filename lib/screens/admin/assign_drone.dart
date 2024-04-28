import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AssignDronePage extends StatelessWidget {
  final TextEditingController pickupLatitudeController = TextEditingController();
  final TextEditingController pickupLongitudeController = TextEditingController();
  final TextEditingController pickupAltitudeController = TextEditingController();
  final TextEditingController dropLatitudeController = TextEditingController();
  final TextEditingController dropLongitudeController = TextEditingController();
  final TextEditingController dropAltitudeController = TextEditingController();

  void assignDrone(BuildContext context) async {
    final pickupLatitude = double.parse(pickupLatitudeController.text);
    final pickupLongitude = double.parse(pickupLongitudeController.text);
    final pickupAltitude = double.parse(pickupAltitudeController.text);
    final dropLatitude = double.parse(dropLatitudeController.text);
    final dropLongitude = double.parse(dropLongitudeController.text);
    final dropAltitude = double.parse(dropAltitudeController.text);

    final url = Uri.parse('http://127.0.0.1:5000/assign_drone');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'pickup_latitude': pickupLatitude.toString(),
        'pickup_longitude': pickupLongitude.toString(),
        'pickup_altitude': pickupAltitude.toString(),
        'drop_latitude': dropLatitude.toString(),
        'drop_longitude': dropLongitude.toString(),
        'drop_altitude': dropAltitude.toString(),
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Drone successfully assigned'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to assign drone'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Drone'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: pickupLatitudeController,
              decoration: InputDecoration(labelText: 'Pickup Latitude'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: pickupLongitudeController,
              decoration: InputDecoration(labelText: 'Pickup Longitude'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: pickupAltitudeController,
              decoration: InputDecoration(labelText: 'Pickup Altitude'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dropLatitudeController,
              decoration: InputDecoration(labelText: 'Drop Latitude'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dropLongitudeController,
              decoration: InputDecoration(labelText: 'Drop Longitude'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: dropAltitudeController,
              decoration: InputDecoration(labelText: 'Drop Altitude'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => assignDrone(context),
              child: Text('Assign Drone'),
            ),
          ],
        ),
      ),
    );
  }
}
