import 'package:coinpay/widgets/reusable_button.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../commons.dart';
import '../../utils/constants.dart';

class NumberAuthentication extends StatefulWidget {
  const NumberAuthentication({super.key});

  @override
  State<NumberAuthentication> createState() => _NumberAuthenticationState();
}

class _NumberAuthenticationState extends State<NumberAuthentication> {
  final TextEditingController _otpController = TextEditingController();
  final bool _isButtonActive = false;

  @override
  void initState() {
    _otpController.addListener(_updateButtonState);
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {});
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
        bottom: progressBar(0.1),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Confirm your phone',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'We send 6 digits code to +880 1720 84 57 57',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
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
                      controller: _otpController,
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
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      fontSize: 16),
                  text: 'Didn\'t get a code? ',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Resend',
                      style: TextStyle(
                        color: kAppDefaultColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: DefaultButton(
        text: 'Verify your number',
        isActive: _isButtonActive,
        onPressed: () {
          Navigator.pushNamed(context, '/email');
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
