import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/injections/injections.dart';
import 'package:taxi/driver/presentation/widgets/widgets.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<LocationBloc>(context).add(GetLocationEvent());
      final locationBloc = BlocProvider.of<LocationBloc>(context);
      locationBloc.positionStream = Geolocator.getPositionStream().listen(
        (pos) { 
          goToPosition(pos, locationBloc);
          
        }
      ) ;
    });
  }

  @override
  Widget build(BuildContext context) {

    final locationBloc = BlocProvider.of<LocationBloc>(context);

    return BlocListener<LocationBloc, LocationState>(
      listener: (context, state) {
          if( state is LocationError){
            return showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.error(
                message: state.errorMessage
              ),
            );
          }
      },
      child: Scaffold(
        key: locationBloc.key,
        body: Stack(
          children: [
            BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {

                print(state);

                if( state is LocationLoading){
                  return const Center(child: CircularProgressIndicator());
                }

                if( state is LocationLoaded ){
                  Position posi = state.pos;
                  CameraPosition currentPos = CameraPosition(
                    target: LatLng(posi.latitude, posi.longitude),
                    zoom: 14.4746,
                  );

                  return GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: currentPos,
                    onMapCreated: (GoogleMapController controller) {
                      // _controller.complete(controller);
                    },
                    myLocationEnabled: true,
                  );
  
                }

                if( state is LocationError){
                  return const Center(child: Text('UY QUE PENAA'));
                }

                return const Center(child: CircularProgressIndicator());

              },
            ),
            const ButtonDrawer(),
            ButtonPositionCurrent(gmcontroller: locationBloc.mapController),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
          label: const Text('Conectarse'),
          icon: const Icon(Icons.play_circle),
        ),
      )
    );
  }

  Future<void> goToPosition(Position pos, LocationBloc locationBloc) async {
    final GoogleMapController controller = await locationBloc.mapController.future;

      await controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0,
          target: LatLng(pos.latitude, pos.longitude),
          tilt: 59,
          zoom: 17
        )
      ));
  }

}
