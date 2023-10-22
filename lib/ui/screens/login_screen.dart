import 'package:feeds/constants/route_names.dart';
import 'package:feeds/ui/helper/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late double height;
  late double width;

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void didChangeDependencies() {
    height =
        MediaQuery.sizeOf(context).height - MediaQuery.paddingOf(context).top;
    width = MediaQuery.sizeOf(context).width;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: getElevatedContainer(
                        width: width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(children: [
                            Image.asset(
                              "assets/images/splash_logo.png",
                              height: height * 0.2,
                            ),
                            getTextField(
                                controller: _mobileController,
                                hint: 'Mobile Number',
                                maxLength: 10,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                textInputType: TextInputType.number),
                            const SizedBox(
                              height: 20,
                            ),
                            getTextField(
                                controller: _passwordController,
                                hint: 'Password',
                                isObscuring: true),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: (){
                                  /*if(_mobileController.text.isEmpty){
                                    showFlushBar(context: context, title: 'Note', message: 'Please enter mobile number');
                                  }else if(_mobileController.text.length<10){
                                    showFlushBar(context: context, title: 'Note', message: 'Invalid mobile number');
                                  }
                                  else if(_passwordController.text.isEmpty){
                                    showFlushBar(context: context, title: 'Note', message: 'Please enter password');
                                  }
                                  else if(_passwordController.text!='123123'){
                                    showFlushBar(context: context, title: 'Note', message: 'Incorrect Password');
                                  }else{
                                    Navigator.pushNamed(context, homeScreen);
                                  }*/
                                  Navigator.pushNamed(context, homeScreen);
                                },
                                child: getButton(text: 'Login', width: width)),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/login_bottom.png",
                      height: height * 0.25,
                      width: width,
                      fit: BoxFit.fill,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
