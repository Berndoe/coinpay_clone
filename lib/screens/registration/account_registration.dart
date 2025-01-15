import 'package:coinpay/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../commons.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});
  static final TextEditingController _numberController =
      TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool fieldstate() {
      if (_numberController.text.length == 10 &&
          _passwordController.text.length > 6) {
        return true;
      }
      return false;
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: progressBar(0.08),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create an Account',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Enter your mobile number to verify your account',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Phone',
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child:
                                        Flag(Flags.bangladesh), // Flag widget
                                  ),
                                  Text(
                                    "+880",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              prefixIconConstraints: const BoxConstraints(
                                minWidth: 0,
                                minHeight: 0,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16,
                                // Adjust vertical alignment
                              ),
                              border: kTextFieldBorder,
                            ),
                            keyboardType: TextInputType.phone),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: TextFormField(
                          controller: _numberController,
                          decoration: InputDecoration(
                            labelText: 'Mobile number',
                            labelStyle: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                            hintText: 'Mobile number',
                            hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                            border: kTextFieldBorder,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          // Ensures the field size remains constant
                          horizontal: 16,
                        ),
                        prefixIcon: const Icon(LineAwesome.lock_solid),
                        hintText: '••••••••',
                        hintStyle: TextStyle(
                            color: Colors.grey[400],
                            letterSpacing: 2,
                            fontSize: 40,
                            fontWeight: FontWeight.w500),
                        prefixIconColor: Colors.grey,
                        suffixIcon: const Icon(Bootstrap.eye),
                        suffixIconColor: Colors.grey,
                        border: kTextFieldBorder,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            style: ButtonStyle(
                padding: getButtonPadding(context),
                backgroundColor: WidgetStateProperty.all<Color>(
                    fieldstate() ? kAppDefaultColor : Colors.grey)),
            onPressed: () {
              showVerificationDialog(context, _numberController);
            },
            child: Text(
              'Sign up',
              style: TextStyle(
                  color: fieldstate() ? Colors.white : Colors.black45,
                  fontSize: 15),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  void showVerificationDialog(
      BuildContext context, TextEditingController numberController) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 2,
          shadowColor: kAppDefaultColor,
          icon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            alignment: Alignment.topRight,
          ),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/confirmation_dialog.jpg'),
                const SizedBox(height: 10),
                const Text(
                  'Verify your phone number before we send code',
                  style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold, height: 1.2),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Is this correct? '),
                    Text(
                      '+880 ${numberController.text}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey[700]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                      padding: getButtonPadding(context,
                          horizontal: MediaQuery.of(context).size.width * 0.3,
                          vertical: MediaQuery.of(context).size.height * 0.02),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(kAppDefaultColor)),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/number_auth');
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                      side: WidgetStateProperty.all<BorderSide>(
                          const BorderSide(color: kAppDefaultColor, width: 2)),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.3,
                            vertical:
                                MediaQuery.of(context).size.height * 0.02),
                      ),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white)),
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
