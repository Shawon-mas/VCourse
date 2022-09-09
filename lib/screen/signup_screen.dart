import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vcourse/constants/text_strings.dart';
import 'package:vcourse/routes/routes.dart';
import 'package:vcourse/widget/brand_color.dart';
import 'package:vcourse/widget/text_widget.dart';
import 'package:vcourse/widget/textformfield_widget.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _isObscure = true;
  final emailController=TextEditingController();
  final nameController=TextEditingController();
  final phoneController=TextEditingController();
  final userNameController=TextEditingController();
  final passwordController=TextEditingController();
  final confirmPasswordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  Color btnColor = Colors.white;
  Color btnText = BrandColors.colorGrey;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    userNameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: BrandColors.bgColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: GestureDetector(onTap: (){
                  Get.back();
                },
                    child: Icon(Icons.arrow_back,color: BrandColors.colorTextBlue,)),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextWidget(
                  value: welcomeTextSignIn,
                  fontWeight: FontWeight.w300,
                  color: BrandColors.yellow,
                  size: 30.sp,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextWidget(
                  value: welcomeSignInTextSignUp,
                  fontWeight: FontWeight.w600,
                  color: BrandColors.colorTextBlue,
                  size: 30.sp,
                ),
              ),
              SizedBox(height: 10.h,),
              Form(
                key: _formKey,
                  child:
                  Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children:
                [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0.09, 1),
                            blurRadius: 2,
                            spreadRadius: 0// Shadow position
                        ),
                      ],
                    ),
                    child: TextFieldWidget(
                        controller: nameController,
                        hintText: signUpNameHint,
                        errorText: "Enter your name",
                        iconData: Icons.person,
                        type: TextInputType.text),
                  ),

                  ),
                  SizedBox(height: 7.h,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 0// Shadow position
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: BrandColors.colorWhite,

                          prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Color.fromRGBO(0, 48, 73, 0.5)
                          ),
                          hintText: signInEmailHint,
                          hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                          contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0,
                              style: BorderStyle.none,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter an email address';
                          } if(!value.contains("@")){
                            return 'Enter an valid email address';
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                    ),

                  ),
                  SizedBox(height: 7.h,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 0// Shadow position
                          ),
                        ],
                      ),
                      child: TextFieldWidget(
                          controller: phoneController,
                          hintText: signUpPhoneHint,
                          errorText: "Enter your phone number",
                          iconData: Icons.phone_iphone_rounded,
                          type: TextInputType.phone),
                    ),

                  ),
                  SizedBox(height: 7.h,),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                              spreadRadius: 0// Shadow position
                          ),
                        ],
                      ),
                      child: TextFieldWidget(
                          controller: userNameController,
                          hintText: signUpUserHint,
                          errorText: "Enter your username",
                          iconData: Icons.person,
                          type: TextInputType.text),
                    ),

                  ),
                  SizedBox(height: 7.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: _isObscure,
                        onChanged: (text){
                          if(passwordController.text.isEmpty){
                            setState(() {
                              btnColor = Colors.white;
                              btnText = BrandColors.colorGrey;
                            });
                          }else if (passwordController.text.length<6){
                            setState(() {
                              btnColor = Colors.white;
                              btnText = BrandColors.colorGrey;
                            });
                          }else{
                            setState(() {
                              btnColor = BrandColors.yellow;
                              btnText = BrandColors.colorWhite;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: BrandColors.colorWhite,
                          prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(0, 48, 73, 0.5)
                          ),
                          suffixIcon: IconButton(onPressed: ()
                          {
                            setState(() {
                              _isObscure = !_isObscure;
                            });

                          }, icon: Icon(_isObscure?Icons.visibility : Icons.visibility_off,)),
                          hintText: signInPasswordHint,
                          hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                          contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0,
                              style: BorderStyle.none,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter your password';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                      child: TextFormField(
                        controller: confirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: _isObscure,
                        onChanged: (text){
                          if(confirmPasswordController.text.isEmpty){
                            setState(() {
                              btnColor = Colors.white;
                              btnText = BrandColors.colorGrey;
                            });
                          }else if (confirmPasswordController.text.length<6){
                            setState(() {
                              btnColor = Colors.white;
                              btnText = BrandColors.colorGrey;
                            });
                          }else{
                            setState(() {
                              btnColor = BrandColors.yellow;
                              btnText = BrandColors.colorWhite;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: BrandColors.colorWhite,
                          prefixIcon: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(0, 48, 73, 0.5)
                          ),
                          suffixIcon: IconButton(onPressed: ()
                          {
                            setState(() {
                              _isObscure = !_isObscure;
                            });

                          }, icon: Icon(_isObscure?Icons.visibility : Icons.visibility_off,)),
                          hintText: signUpCPasswordHint,
                          hintStyle: TextStyle(fontSize: 16.sp, color: Color.fromRGBO(0, 48, 73, 0.5)),
                          contentPadding: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0,
                              style: BorderStyle.none,),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter your password';
                          }else{
                            return null;
                          }
                        },
                      ),
                    ),
                  ),

                ],
              )
              ),
              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account",
                      style: TextStyle(
                        shadows: [
                          Shadow(
                              color: BrandColors.colorTextBlue,
                              offset: Offset(0, -5))
                        ],
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.transparent,
                        decoration:
                        TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationThickness: 2,


                      ),
                    ),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        Get.offNamed(signin);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          shadows: [
                            Shadow(
                                color: BrandColors.yellow,
                                offset: Offset(0, -5))
                          ],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.transparent,



                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    height: 50,
                    minWidth: double.maxFinite,
                    color: btnColor,

                    child: Text("Sign Up",style: TextStyle(
                        color: btnText,
                        fontSize: 18,
                        fontWeight: FontWeight.bold

                    ),),
                    onPressed: ()
                    {
                      if(_formKey.currentState!.validate())
                      {

                      }
                    }

                ),
              ),

            ],
          ),
        ),

      ),
    );
  }
}
