import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_project/modules/login_screen/cubit/cubit.dart';
import 'package:shop_project/modules/login_screen/cubit/state.dart';
import 'package:shop_project/modules/singin_screen/singin_screen.dart';
import 'package:shop_project/modules/welcome_screen/welcome_screen.dart';
import 'package:shop_project/shared/Constans/constans.dart';
import 'package:shop_project/shared/Styles/colors.dart';
import 'package:shop_project/shared/compoenets/components.dart';
class LoginScreen extends StatelessWidget {


  var formkey =GlobalKey<FormState>();
  bool _secirty = true;

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LogInStates>(
      listener: (BuildContext context,  state) {},
    builder: (BuildContext context,   state) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // Image(image: AssetImage('assets/images/welcome.png'),),
                    Text('Login Now ',
                      style: TextStyle(fontSize: 30, color: Colors.black54, fontWeight: FontWeight.w600),),
                    Text('login now to browse our hot offers',
                        style:TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98),)),
                    SizedBox(
                      height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,),
                      child: defulutTextFormFild(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        labeltext: 'Email Adress',
                        hintText: 'Enter Email Adress',
                        obscureText: !_secirty,
                        prefix: Icon(Icons.email, color: defultColor,),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                            return 'Please a valid Email';
                          }
                          return null;

                        },

                      ),
                    ),
                    SizedBox(
                      height:  20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25,),
                      child: defulutTextFormFild(
                          controller: passController,
                          type: TextInputType.text,
                          labeltext: 'Password',
                          hintText: 'Enter Password',
                          obscureText: _secirty,
                          prefix: Icon(Icons.lock, color: defultColor,),
                          suffix: IconButton(onPressed: () {
                            // setState(() {
                            //   _secirty =!_secirty;
                            // });
                          },
                            icon: Icon(_secirty ? Icons.visibility : (Icons
                                .visibility_off),),),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            if(value.length <=5)
                            {
                              return 'Please enter long password';
                            }
                            return null;}

                      ),
                    ),
                    SizedBox(
                      height: 20,),
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) => defultMaterialButton(height: 50, width: 250,text: 'LOGIN',
                        function:(){
                          if (formkey.currentState.validate()){
                            print(passController.text);
                            LoginCubit.get(context).UserLogin(email: emailController.text, password:passController.text);

                            //NavigateTo(router:WelcomeScreen(),context: context);
                          }
                        },
                      ),
                      fallback: (context) => CircularProgressIndicator(),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account ?',style:TextStyle(fontWeight: FontWeight.w300,color: Color(0xFF8D8E98),)),
                        defultTextButton(text: 'Sign Up...', onPressed:() {
                          NavigateTo(router: SignUpScreen(),context: context);

                        },),

                      ],
                    ),







                  ],
                ),
              ),
            ),
          ),
        )
    );
    }
      )
    );
  }
}
