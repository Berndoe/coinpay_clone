import 'package:coinpay/utils/constants.dart';
import 'package:coinpay/widgets/reusable_button.dart';
import 'package:flutter/material.dart';

import '../../commons.dart';
import '../../widgets/authentication_fields.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonActive = false;

  @override
  void initState() {
    _numberController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    super.initState();
  }

  @override
  void dispose() {
    _numberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonActive = _numberController.text.length == 10 &&
          _passwordController.text.length > 6;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              Authentication(
                  numberController: _numberController,
                  passwordController: _passwordController),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DefaultButton(
          isActive: _isButtonActive,
          onPressed: () {
            showVerificationDialog(context, _numberController);
          },
          text: 'Sign up'),
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
