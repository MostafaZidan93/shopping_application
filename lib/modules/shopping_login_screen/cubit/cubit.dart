import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/modules/shopping_login_screen/cubit/states.dart';
import 'package:shopping_application/shared/network/end_points.dart';
import 'package:shopping_application/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {

  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(BuildContext context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
}){
    print("Did Enter userLogin !!!!!!: email is: $email password is: $password");
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email': email,
          'password': password,
        }
    ).then((value) {
      print("response is: ${value.data}");
      emit(ShopLoginSuccessState());
    }).catchError((err){
      print("error is: ${err}!!!!!!!!!");
      emit(ShopLoginErrorState(err));

    });
  }
}