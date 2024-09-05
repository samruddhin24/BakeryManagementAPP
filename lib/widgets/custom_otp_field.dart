import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOtpField extends StatefulWidget {
  final int length;
  final Function(String) onOtpEntered;
  const CustomOtpField({this.length = 6, required this.onOtpEntered, Key? key});

  @override
  State<CustomOtpField> createState() => _CustomOtpFieldState();
}

class _CustomOtpFieldState extends State<CustomOtpField> {

  List<TextEditingController> controllers = [];

  @override
  void initState(){
    super.initState();
    controllers = List.generate(widget.length, (index) => TextEditingController());
  }

  @override
  void dispose(){
    super.dispose();
    controllers.forEach((controller) => controller.dispose());
  }

  String getOtp() {
    String otp = '';
    for (var controller in controllers) {
      otp += controller.text;
    }
    return otp;
  }

  void onOtpChanged() {
    String otp = getOtp();
    if (otp.length == widget.length) {
      widget.onOtpEntered(otp); // Send the OTP to the parent widget
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.length, (index){
        return Flexible(
          child: Container(
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              )
            ),
            child: TextField(
              controller: controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              style: const TextStyle(fontSize: 24),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: "",
              ),
              onChanged: (value){
                if(value.isNotEmpty && index < widget.length - 1){
                  FocusScope.of(context).nextFocus();
                }else if(value.isEmpty && index > 0){
                  FocusScope.of(context).previousFocus();
                }
                onOtpChanged();
              },
            ),
          ),
        );
      }),
    );
  }
}
