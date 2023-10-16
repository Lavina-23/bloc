import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  // True = light, False = dark
  ThemeBloc() : super(true);

  void changeTheme() => emit(!state);
}