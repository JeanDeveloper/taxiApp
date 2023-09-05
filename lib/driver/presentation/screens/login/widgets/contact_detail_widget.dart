import 'package:flutter/material.dart';
import 'package:taxi/app/core/constants/constants.dart';
import 'package:taxi/app/core/themes/colors.dart';
import 'package:taxi/app/domain/entities/gender.dart';
import 'package:taxi/app/presentation/widgets/widgets.dart';
import 'package:taxi/driver/presentation/screens/login/widgets/widgets.dart';

class ContactDetailWidget extends StatefulWidget {
  const ContactDetailWidget({super.key});
  @override
  State<ContactDetailWidget> createState() => _ContactDetailWidgetState();
}

class _ContactDetailWidgetState extends State<ContactDetailWidget> {
  late TextEditingController name;
  late TextEditingController surname;
  late TextEditingController document;
  late TextEditingController email;
  late TextEditingController address;
  Gender? _selectedGender;

  @override
  void initState() {
    name = TextEditingController();
    surname = TextEditingController();
    document = TextEditingController();
    email = TextEditingController();
    address = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: SizedBox(
        height: size.height * .85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        
            SizedBox(height:  size.height * .03),
      
            const Text("Ingresa tu informacion Personal", style: TextStyle(fontWeight: FontWeight.bold)),
            
            SizedBox(height:  size.height * .03),
            
            Container(
              width: size.width * .5,
              height: size.height * .07,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: TaxiColors.lightGrey,
                borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Gender>(
                  isExpanded: true,
                  hint: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("Genero"),
                  ),
                  items: Constants.genders.map(
                    (gender) => DropdownMenuItem(
                      value: gender,  
                      child: Text(gender.gender)
                    ) 
                  ).toList(),
                  value: _selectedGender,
                  onChanged: (value) {
                    setState((){
                      _selectedGender = value;
                    });
                  },
                ),
              ),
            ),
        
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Nombres",
              controller: name,
              keyboardType: TextInputType.name,
            ),
        
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Apellidos",
              controller: surname,
              keyboardType: TextInputType.name,
            ),
        
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Documento de Identidad",
              controller: document,
              keyboardType: TextInputType.number,
            ),
        
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Correo",
              controller: email,
              keyboardType: TextInputType.emailAddress,
            ),
        
            SizedBox(height:  size.height * .02),
      
            CustomTextInput(
              hinttext: "Direccion",
              controller: address,
              keyboardType: TextInputType.streetAddress,
            ),
        
            // SizedBox(height: size.height * .05),

            const Spacer(),
      
            CustomButtonWidget(
              width: size.width,
              child: const Text("Continuar", style: TextStyle(color: TaxiColors.white)),              
              onPressed: (){

              },
            )
           
          ],
        ),
      ),
    );
  }

}