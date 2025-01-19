import 'package:flutter/material.dart';

import '../../commons.dart';
import '../../widgets/back_button.dart';
import '../../widgets/reusable_button.dart';

class AddressSetup extends StatelessWidget {
  AddressSetup({super.key});

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();

  bool isFilled() {
    return _addressController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _postCodeController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: backIcon(context),
        bottom: progressBar(0.2),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Home address',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'This info needs to be accurate with your ID\n document.',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Address Line',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Mr Jhon Doe',
                  hintText: '',
                  labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  border: kTextFieldBorder,
                ),
                keyboardType: TextInputType.streetAddress,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'City',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City, State',
                  hintText: 'City, State',
                  labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  border: kTextFieldBorder,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Postcode',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                controller: _postCodeController,
                decoration: InputDecoration(
                  labelText: 'Ex:00000',
                  hintText: 'Ex:00000',
                  labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  border: kTextFieldBorder,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: DefaultButton(
          isActive: isFilled(), text: 'Continue', onPressed: () {}),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
