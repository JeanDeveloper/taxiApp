import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "${authBloc.user!.name} ${authBloc.user!.surname}",
                    // authBloc.user!.name ?? "",
                    // _con.driver?.username ?? 'Nombre de usuario',
                    style: TextStyle(
                      color: TaxiColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    maxLines: 1,
                  ),
                ),
                Container(
                  child: Text(
                    authBloc.user!.email!,
                    // _con.driver?.email ?? 'Correo electronico' ,
                    style: TextStyle(
                      color: TaxiColors.white.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/png/taxi.png'),
                  radius: 40,
                )
              ],
            ),
            decoration: const BoxDecoration(
              color: TaxiColors.primaryColor,
            ),
          ),
          
          ListTile(
            title: Text('Viajes'),
            trailing: Icon(Icons.cases_outlined),
            // leading: Icon(Icons.cancel),
            onTap: () {},
          ),

          ListTile(
            title: Text('Cerrar sesion'),
            trailing: Icon(Icons.power_settings_new),
            // leading: Icon(Icons.cancel),
            onTap: (){
              Navigator.of(context).pop();
              authBloc.add(DoLogoutEvent());
            },
          ),
        ],
      ),
    );
  }
}