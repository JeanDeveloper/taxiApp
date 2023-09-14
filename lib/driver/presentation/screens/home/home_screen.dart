import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/utils/map_utils.dart';
import 'package:taxi/customer/presentation/screens/screens.dart';
import 'package:taxi/driver/presentation/screens/home/widgets/widgets.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:taxi/app/core/injections/injections.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi/driver/presentation/widgets/widgets.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';
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
  Set<Marker> _markers = <Marker>{};
  late BitmapDescriptor _markerDriver;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationBloc = BlocProvider.of<LocationBloc>(context);
      locationBloc.add(GetLocationEvent());
      final authBloc = context.read<AuthBloc>();
      MapUtils.createMarketImageFromAsset("assets/png/taxi-little.png")
          .then((result) {
        _markerDriver = result;
      }); 

      locationBloc.positionStream = Geolocator.getPositionStream(
          locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.best,
        distanceFilter: 2,
      )).listen((pos) {
        goToPosition(pos, locationBloc);
        addMarker(
          'driver',
          pos.latitude,
          pos.longitude,
          "Mi Posicion",
          'Este es el content',
          _markerDriver,
          pos,
        );
        //CREO QUE AQUI NO DEBERIA IR SINO ESTO SE GUARDARÁ CUANDO SE PRESIONE EL BOTON CONECTARSE.
        // BlocProvider.of<LocationBloc>(context).add(SaveLocationEvent(authBloc.user!, pos));

        if (locationBloc.isOnline) {
          BlocProvider.of<LocationBloc>(context)
              .add(SaveLocationEvent(authBloc.user!, pos));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state is LocationError) {
            return showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(message: state.errorMessage),
            );
          }
        },
        child: Scaffold(
          drawer: DrawerWidget(),
          key: locationBloc.key,
          body: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLogout) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ( _ ) =>  const LoginScreen()));
              }
            },
            child: Stack(
              children: [
                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    if (state is LocationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is LocationLoaded) {
                      Position posi = state.pos; 

                      CameraPosition currentPos = CameraPosition(
                        target: LatLng(posi.latitude, posi.longitude),
                        zoom: 19,
                      );

                      return GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: currentPos,
                        onMapCreated: (GoogleMapController controller) {
                          locationBloc.mapController.complete(controller);
                        },
                        myLocationEnabled: true,
                        padding: EdgeInsets.symmetric(vertical: 70),
                        markers: Set<Marker>.of(_markers),
                      );
                    }

                    if (state is LocationError) {
                      return const Center(
                          child: Text('No se ha podido cargar el mapa'));
                    }

                    return const Center(child: CircularProgressIndicator());
                  },
                ),
                const ButtonDrawer(),
                ButtonPositionCurrent(gmcontroller: locationBloc.mapController),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              if (locationBloc.isOnline == true) {
                if (locationBloc.positionStream == null)
                  locationBloc.positionStream!.cancel();
                BlocProvider.of<LocationBloc>(context)
                    .add(RemoveLocationEvent(authBloc.user!.uid));
              }

              setState(() {
                locationBloc.isOnline = !(locationBloc.isOnline);
              });
            },
            label: (locationBloc.isOnline)
                ? const Text('Desconectarse')
                : const Text('Conectarse'),
            icon: (locationBloc.isOnline)
                ? const Icon(Icons.offline_bolt)
                : const Icon(Icons.play_circle),
          ),
        ));
  }

  Future<void> goToPosition(Position pos, LocationBloc locationBloc) async {
    final GoogleMapController controller =
        await locationBloc.mapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 0,
            target: LatLng(pos.latitude, pos.longitude),
            tilt: 0,
            zoom: 19
        )
      )
    );
  }

  void addMarker(
    String markerId,
    double lat,
    double lng,
    String title,
    String content,
    BitmapDescriptor iconMarker,
    Position pos,
  ) {
    MarkerId id = MarkerId(markerId);
    Marker marker = Marker(
        markerId: id,
        position: LatLng(lat, lng),
        icon: iconMarker,
        infoWindow: InfoWindow(title: title, snippet: content),
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: const Offset(0.5, 0.5),
        rotation: pos.heading);
    bool isAdded = _markers.add(marker);
    if (isAdded) {
      setState(() {});
    }
  }
}
