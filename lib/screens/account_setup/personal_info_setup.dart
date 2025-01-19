import 'package:flutter/material.dart';

import '../../widgets/reusable_button.dart';

class PersonalInfoSetup extends StatelessWidget {
  const PersonalInfoSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: []),
      ),
      floatingActionButton:
          DefaultButton(isActive: true, text: 'Continue', onPressed: () {}),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
