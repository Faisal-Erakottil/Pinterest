import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../botttomBar/bottombar.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.context) : super(SplashInitial()) {
    delay();
  }

  BuildContext context;

  delay() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => BootomBar(),
    ));
  }
}
