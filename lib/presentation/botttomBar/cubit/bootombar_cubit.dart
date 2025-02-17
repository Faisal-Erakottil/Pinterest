import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bootombar_state.dart';

class BootombarCubit extends Cubit<BootombarState> {
  BootombarCubit() : super(BootombarInitial());

  int selectedIndex = 0;

  updateIndex(int index) {
    selectedIndex = index;
    //print(selectedIndex);
    emit(BootombarInitial());
  }
}
