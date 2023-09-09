import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/injections/injections.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/driver/presentation/widgets/widgets.dart';
import 'package:taxi/app/presentation/blocs/location/location_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LocationBloc>()),
      ],
      child: const HomeScreenInit(),
    );
  }

}

class HomeScreenInit extends StatefulWidget {
  const HomeScreenInit({super.key});

  @override
  State<HomeScreenInit> createState() => _HomeScreenInitState();
}

class _HomeScreenInitState extends State<HomeScreenInit> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-9.084479755169513, -78.57767754372975),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-9.084479755169513, -78.57767754372975),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(GetLocationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {

              if( state is LocationLoading){
                return const Center(child: CircularProgressIndicator());
              }

              if( state is LocationLoaded ){
                Position pos = state.position;

                 CameraPosition currentPos = CameraPosition(
                  target: LatLng(pos.latitude, pos.longitude),
                  zoom: 14.4746,
                );

                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: currentPos,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                );
                
              }

              if( state is LocationError){
                return Text(state.errorMessage);
              }

              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              );


            },
          ),
          const ButtonDrawer(),
          ButtonPositionCurrent(gmcontroller: _controller),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goOnline,
        label: const Text('Conectarse'),
        icon: const Icon(Icons.play_circle),
      ),
    );
  }

  Future<void> _goOnline() async {
    print("Taxi en linea");
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
