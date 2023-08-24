import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_application/modules/shopping_login_screen/cubit/states.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {

  ShopLoginCubit() : super(ShopLoginInitialState());
  static get(BuildContext context) => BlocProvider.of(context);

  void userLogin(){

  }
}