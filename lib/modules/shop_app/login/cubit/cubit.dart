// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:firstapplication/modules/shop_app/login/cubit/states.dart';
import 'package:firstapplication/shared/network/end_points.dart';
import 'package:firstapplication/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit() : super(ShopLoginInitialState());
static ShopLoginCubit get(context)=>BlocProvider.of(context);

void userLogin({
  @required String ?email,
  @required String ?password,
}){
  emit(ShopLoginLoadingState());
DioHelper.postData(
  url: LOGIN,
  lang: 'en',
  data: {
" email":email,
" password":password,
  },
).then((value) {
  print(value.data);
 emit(ShopLoginsSuccessState());
}).catchError((error){
emit(ShopLoginErrorState(error.toString()));
print(error.toString());
});
  }
  IconData suffix =Icons.visibility_outlined;
  bool isPassword=true;
void ChangePasswordVisibility(){
  isPassword=!isPassword;
 if(isPassword){
   suffix=Icons.visibility_outlined;
 }else{
   suffix=Icons.visibility_off_outlined;
 }

  emit(ShopChangePasswordVisibilityState());
}


}

