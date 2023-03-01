// ignore_for_file: avoid_print

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firstapplication/modules/shop_app/login/cubit/cubit.dart';
import 'package:firstapplication/modules/shop_app/login/cubit/states.dart';
import 'package:firstapplication/modules/shop_app/shop_register/shop_register_screen.dart';
import 'package:firstapplication/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ShopLoginScreen extends StatelessWidget {

  var formkey=GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  ShopLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context, state){},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body:
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                    Form(
                      key: formkey,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style:Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight:FontWeight.bold,color: Colors.black),

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Let's Start The Shopping",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),
                          ),

                          const SizedBox(
                            height: 40.0,
                          ),

                          defaultformfiled(controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (value){
                              if(value!.isEmpty){

                                return "email shouldn't be Empty";
                              }

                              return null;},
                            label:'Email' ,
                            prefix: Icons.email,),
                          const SizedBox(
                            height: 20.0,
                          ),

                          defaultformfiled(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            ispassword: ShopLoginCubit.get(context).isPassword,
                            suffix: ShopLoginCubit.get(context).suffix,
                            onSubmit: (value){
                              if(formkey.currentState!.validate()){
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            suffixpreesed:(){
                              ShopLoginCubit.get(context).ChangePasswordVisibility();
                            },
                            validate: (value){
                              if(value!.isEmpty){

                                return "Password Is To Short";
                              }

                              return null;},
                            label: 'Password',
                            prefix: Icons.lock,
                          ),


                          const SizedBox(
                            height: 30.0,
                          ),

                          ConditionalBuilder(
                            condition: state is!ShopLoginLoadingState,
                            builder: (context) =>defaultButton(

                                text: 'login',

                                function: (){
                                  if(formkey.currentState!.validate()){
                                  ShopLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                }

                                }


                            ),

                            fallback: (context) => const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              const Text(

                                "If u Don't have account?",
                                style: TextStyle(

                                  fontSize: 15,

                                ),
                              ),

                              defaultTextButton(function: (){
                                navigateTo(context, const ShopRegisterScreen());},
                                text: 'Register Now!',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),)
                            ],


                          ),


                        ],

                      ),
                    ),

                  ),
                ),
              )



          );
        },

      ),
    );
  }
}







