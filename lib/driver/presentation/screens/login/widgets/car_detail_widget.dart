import 'package:flutter/material.dart';
import 'package:taxi/app/core/constants/constants.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/domain/entities/gender.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';

class CarDetailWidget extends StatefulWidget {
  const CarDetailWidget({super.key});
  @override
  State<CarDetailWidget> createState() => _CarDetailWidgetState();
}

class _CarDetailWidgetState extends State<CarDetailWidget> {
  late TextEditingController plateNumber;
  late TextEditingController yearVehicle;

  @override
  void initState() {
    plateNumber = TextEditingController();
    yearVehicle = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          SizedBox(height:  size.height * .02),
          const Text("Ingresa la informacion del vehiculo", style: TextStyle(fontWeight: FontWeight.bold)),

          SizedBox(height:  size.height * .02),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SizedBox(
                width: size.width * .43,
                child: CustomTextInput(
                  textCapitalization: TextCapitalization.sentences,
                  hinttext: "Placa del vehiculo",
                  controller: plateNumber,
                  keyboardType: TextInputType.name,
                ),
              ),

              SizedBox(
                width: size.width * .43,
                child: CustomTextInput(
                  hinttext: "Año del vehiculo",
                  controller: yearVehicle,
                  keyboardType: TextInputType.name,
                ),
              ),

            ],
          ),

          SizedBox(height:  size.height * .02),
          Container(
            height: size.height * .07,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: TaxiColors.lightGrey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Gender>(
                isExpanded: true,
                hint: const Text("Modelo del Vehiculo"),
                items: Constants.genders.map(
                  (gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender.gender)
                    )
                ).toList(), 
                onChanged: (value) => print(value),
              ),
            ),
          ),

          SizedBox(height:  size.height * .02),
          Container(
            height: size.height * .07,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: TaxiColors.lightGrey,
              borderRadius: BorderRadius.circular(10)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Gender>(
                isExpanded: true,
                hint: const Text("Color del Vehiculo"),
                items: Constants.genders.map(
                  (gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender.gender)
                    )
                ).toList(), 
                onChanged: (value) => print(value),
              ),
            ),
          ),


          SizedBox(height: size.height * .05),
          OutlinedButton(
            style:OutlinedButton.styleFrom(
              backgroundColor: TaxiColors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            onPressed: (){}, 
            child: const Text("Continuar", style: TextStyle(color: TaxiColors.white))
          ),


        ],
      ),
    );
  }

}