import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/domain/entities/drive.dart';
import 'package:taxi/app/domain/entities/driver.dart';
import 'package:taxi/app/presentation/blocs/auth/auth_bloc.dart';
import 'package:taxi/app/presentation/widgets/widgets.dart';
import 'package:taxi/driver/domain/entities/color_vehicle.dart';
import 'package:taxi/driver/domain/entities/model_vehicle.dart';
import 'package:taxi/driver/presentation/blocs/color/color_bloc.dart';
import 'package:taxi/driver/presentation/blocs/register/model_bloc.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';

class CarDetailWidget extends StatefulWidget {
  const CarDetailWidget({super.key});
  @override
  State<CarDetailWidget> createState() => _CarDetailWidgetState();
}

class _CarDetailWidgetState extends State<CarDetailWidget> {
  late TextEditingController plateNumber;
  late TextEditingController yearVehicle;
  ModelVehicle? _selectedModel;
  ColorVehicle? _selectedColor;

  @override
  void initState() {
    plateNumber = TextEditingController();
    yearVehicle = TextEditingController();
    BlocProvider.of<ModelBloc>(context).add(GetModelEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return BlocListener<ModelBloc, ModelState>(
      listener: (context, state) {
        if (state is RegisterError) {
          Fluttertoast.showToast(
            msg: state.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: size.height * .02),
            const Text("Ingresa la informacion del vehiculo",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * .43,
                  child: CustomTextInput(
                    maxLength: 6,
                    textCapitalization: TextCapitalization.characters,
                    hinttext: "Placa del vehiculo",
                    controller: plateNumber,
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                  width: size.width * .43,
                  child: CustomTextInput(
                    hinttext: "Año del vehiculo",
                    maxLength: 4,
                    controller: yearVehicle,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * .02),
            Container(
              height: size.height * .07,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: TaxiColors.lightGrey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: BlocBuilder<ModelBloc, ModelState>(
                builder: (context, state) {
                  if (state is RegisterInitial) {
                    BlocProvider.of<ModelBloc>(context).add(GetModelEvent());
                  }

                  if (state is RegisterLoading) {
                    return Container();
                  }

                  if (state is RegisterLoaded) {
                    final models = state.modelVehicle;
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<ModelVehicle>(
                        isExpanded: true,
                        hint: const Text("Color del Vehiculo"),
                        items: models
                            .map((model) => DropdownMenuItem(
                                value: model, child: Text(model.description)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedModel = value;
                          });
                        },
                        value: _selectedModel,
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ),
            SizedBox(height: size.height * .02),
            Container(
              height: size.height * .07,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: TaxiColors.lightGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: BlocBuilder<ColorBloc, ColorState>(
                builder: (context, state) {
                  if (state is ColorInitial) {
                    BlocProvider.of<ColorBloc>(context).add(GetColorEvent());
                  }

                  if (state is ColorLoading) {
                    return Container();
                  }

                  if (state is ColorLoaded) {
                    final colors = state.colorVehicle;
                    return DropdownButtonHideUnderline(
                      child: DropdownButton<ColorVehicle>(
                        isExpanded: true,
                        hint: const Text("Modelo del Vehiculo"),
                        items: colors
                            .map((model) => DropdownMenuItem(
                                value: model, child: Text(model.name)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedColor = value;
                          });
                        },
                        value: _selectedColor,
                      ),
                    );
                  }

                  return Container();
                },
              ),
            ),
            SizedBox(height: size.height * .05),

            CustomButtonWidget(
              width: size.width,
              onPressed: () {

                Driver user = authBloc.user as Driver;

                Drive drive = Drive(
                  plate   : plateNumber.text,
                  year    : yearVehicle.text,
                  model :   _selectedModel,
                  color : _selectedColor,
                  idUser  : user.uid,
                );
                BlocProvider.of<AuthBloc>(context).add(SaveDriveDetailEvent(drive));

              },
              child: const Text("Continuar", style: TextStyle(color: TaxiColors.white)),              
            ),


            // OutlinedButton(
            //   style: OutlinedButton.styleFrom(
            //     backgroundColor: TaxiColors.purple,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 150, 
            //       vertical: 15
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     )
            //   ),
            //   onPressed: () {
            //     Driver user = authBloc.user as Driver;

            //     Drive drive = Drive(
            //       plate   : plateNumber.text,
            //       year    : yearVehicle.text,
            //       idModel : (_selectedModel == null ) ? "" : _selectedModel!.id,
            //       idColor : ( _selectedColor == null ) ? "" : _selectedColor!.id,
            //       idUser  : user.uid,
            //     );
            //     BlocProvider.of<AuthBloc>(context).add(SaveDriveDetailEvent(drive));
            //   },
            //   child: const Text("Continuar",
            //       style: TextStyle(color: TaxiColors.white))
            // ),





          ],
        ),
      ),
    );
  }
}
