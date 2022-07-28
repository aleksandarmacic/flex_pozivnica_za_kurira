import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import '../../labels.dart';
import '../main_screen.dart';
import '../widgets/custom_increment_decrement_field.dart';
import '../widgets/custom_input_dropdown_field_payment.dart';
import '../widgets/custom_input_dropdown_multichoice_field.dart';
import '../widgets/custom_input_text_field.dart';
import '../widgets/custom_input_dropdown_field_delivery.dart';
import '../widgets/custom_input_dropdown_field_weight.dart';
import '../widgets/top_container.dart';

class DeliveryDetails extends StatefulWidget {
  DeliveryDetails(
  {
    required this.controllerDeliveryContent,
    required this.controllerDeliveryBuyOut,
    required this.controllerDeliveryValue,
    required this.controllerNumber,
}
): super();

  TextEditingController controllerDeliveryContent;
  TextEditingController controllerDeliveryBuyOut;
  TextEditingController controllerDeliveryValue;
  TextEditingController controllerNumber;



  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TopContainer(
          label: kDeliveryData,
        ),
        CustomIncrementDecrementField(label: kNumberPackage, controllerNumber: widget.controllerNumber),
        CustomInputDropDownFieldDelivery(label: kDelivery),
        CustomInputDropDownFieldWeight(label: kWeight, isRequired: true),
        CustomInputTextField(label: kContent, controllerDeliveryContent: widget.controllerDeliveryContent),
        CustomInputTextField(label: kBuyOut, isForBuyOut: true, controllerDeliveryBuyOut: widget.controllerDeliveryBuyOut),
        CustomInputTextField(label: kValue, isForBuyOut: true, controllerDeliveryValue: widget.controllerDeliveryValue),
        CustomInputDropDownMultiChoiceField(label: kAdditionalService),
        CustomInputDropDownFieldPayment(label: kPayment, isRequired: true),
      ],
    );
  }
}
