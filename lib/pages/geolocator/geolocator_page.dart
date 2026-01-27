import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPage extends StatefulWidget {
  const GeolocatorPage({super.key});

  @override
  State<GeolocatorPage> createState() => _GeolocatorPageState();
}

class _GeolocatorPageState extends State<GeolocatorPage> {
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Position? posicao;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    //possição em tempo real modo maximo inativado, devido a travamento no app
    //   return await Geolocator.getCurrentPosition();

    //Linha de codigo substituida para evitar travamento no app
    // ignore: deprecated_member_use
    return await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.medium,
      // ignore: deprecated_member_use
      timeLimit: const Duration(seconds: 6),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Localizador")),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  // Position position = await Geolocator.getCurrentPosition(
                  //   desiredAccuracy: LocationAccuracy.high,
                  // );
                  Position novaPosicao = await _determinePosition();
                  setState(() {
                    posicao = novaPosicao;
                  });
                  print(novaPosicao);
                },
                child: Text("Obter Localização"),
              ),
              Text(
                posicao == null
                    ? "Localização não obtida"
                    : "Latitude: ${posicao!.latitude}\nLongitude: ${posicao!.longitude}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
