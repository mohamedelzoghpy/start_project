// ignore: file_names
//import 'package:flutter/cupertino.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:firstapplication/shared/components/components.dart';

import '../home/home_screen.dart';
import 'package:flutter/material.dart';

class login_screen  extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
 String UserName='mohamed';

 String Password='mohamed';

 var username=TextEditingController();

 var password=TextEditingController();

 var formkey=GlobalKey<FormState>();

 var ispassword=true;

 @override
  Widget build(BuildContext context) {



    return Scaffold(

      appBar: AppBar(

        title: const Text(

          'loginScreen',
              style: TextStyle(

            fontSize: 30,
                fontStyle: FontStyle.italic,
        ),
        ),

      ),

      body:


      Center(
        child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Stack(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,


                    ),
                  ),

                  Expanded(
                    child: Form(
                      key:formkey ,
                      child: Column(



                        children: [

                          Container(
                            alignment: AlignmentDirectional.topStart,
                           // color:Colors.cyan.withOpacity(0.266),
                            child: const Text(
                              'login',
                              style: TextStyle(
                                fontSize: 50,
                                fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  shadows: <Shadow>[
                              Shadow(
                              offset: Offset(4.0, 4.0),
                              blurRadius: 0.7,
                              color: Colors.blue,
                            ),
                        ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                        defaultformfiled(controller: username,
                            type: TextInputType.emailAddress,
                            validate: (value){
                              if(value!.isEmpty){

                                return "email should't be Empty";
                              }

                              return null;},
                          label:'Email' ,
                            prefix: Icons.email,),
                          const SizedBox(
                            height: 20.0,
                          ),

                          defaultformfiled(
                              controller: password,
                              type: TextInputType.visiblePassword,
                              ispassword: ispassword,
                              suffixpreesed:(){
                            setState((){

                              ispassword = !ispassword;

                            });


                              },
                              validate: (value){
                                if(value!.isEmpty){

                                  return "email shouldn't be Empty";
                                }

                                return null;},
                              label: 'Password',
                              prefix: Icons.lock,
                          suffix: ispassword? Icons.visibility : Icons.visibility_off,
                          ),


                          const SizedBox(
                            height: 20.0,
                          ),

                         defaultButton(

                           text: 'login',

                           function: (){
                             formkey.currentState?.validate();

                             },
                         ),
                          const SizedBox(
                            height: 20.0,
                          ),


                          Row(
                            children: [

                              const Text(

                                "if u don't have account?",
                            style: TextStyle(

                              fontSize: 15,

                            ),
                              ),

                       TextButton(onPressed:(){},


                           child:
                       const Text(
                         'Regisiter Now!',
                         style: TextStyle(
                           fontSize: 15,
                         ),

                       ),

                       ),

                            ],


                          ),









                        ],




                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      )



    );
  }
}



