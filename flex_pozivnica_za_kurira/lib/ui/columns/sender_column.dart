
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../labels.dart';
import '../widgets/custom_input_text_field.dart';
import '../widgets/top_container.dart';

class SenderColumn extends StatelessWidget {
  SenderColumn(
      {
        required this.controllerSenderNameSurname,
        required this.controllerSenderCity,
        required this.controllerSenderAddress,
        required this.controllerSenderHomeNumber,
        required this.controllerSenderPostalNumber,
        required this.controllerSenderPhone,
        required this.controllerSenderContact,
        required this.controllerSenderEmail,
        required this.controllerSenderNote,

  }
  ) : super();

  TextEditingController controllerSenderNameSurname;
  TextEditingController controllerSenderCity;
  TextEditingController controllerSenderAddress;
  TextEditingController controllerSenderHomeNumber;
  TextEditingController controllerSenderPostalNumber;
  TextEditingController controllerSenderPhone;
  TextEditingController controllerSenderContact;
  TextEditingController controllerSenderEmail;
  TextEditingController controllerSenderNote;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TopContainer(
          label: kSenderData,
        ),
        CustomInputTextField(
            controllerSenderNameSurname: controllerSenderNameSurname,
            isRequired: true,
            isForSenderColumn: true,
            label: kNameSurname
        ),
        CustomInputTextField(
          controllerSenderCity: controllerSenderCity,
          isRequired: true,
          isForSenderColumn: true,
          label: kCity,
        ),
        CustomInputTextField(
          controllerSenderAddress: controllerSenderAddress,
          isRequired: true,
          isForSenderColumn: true,
          label: kAddress,
        ),
        CustomInputTextField(
          controllerSenderHomeNumber: controllerSenderHomeNumber,
          label: kHomeNumber,
          isForPhone: true,
          isForSenderColumn: true,
        ),
        CustomInputTextField(
          controllerSenderPostalNumber: controllerSenderPostalNumber,
          isForPhone: true,
          isForSenderColumn: true,
          label: kPostalNumber,
        ),
        CustomInputTextField(
          controllerSenderPhone: controllerSenderPhone,
          isRequired: true,
          isForSenderColumn: true,
          isForPhone: true,
          label: kPhone,
        ),
        CustomInputTextField(
          controllerSenderContact: controllerSenderContact,
          label: kContact,
          isForSenderColumn: true,
        ),
        CustomInputTextField(
            controllerSenderEmail: controllerSenderEmail,
            label: kEmail
        ),
        CustomInputTextField(
          controllerSenderNote: controllerSenderNote,
          isForNotes: true,
          isForSenderColumn: true,
          label: kNote,
        ),
      ],
    );
  }
}
