import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tasbeeh_state.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit() : super(TasbeehInitial());
  String tasbeehButtonLabel = 'سبحان الله';
  int tasbeehCounter = 0;

  void changeTasbeehButtonDisplay() {
    if (tasbeehButtonLabel == 'سبحان الله') {
      tasbeehButtonLabel = 'الحمد لله';
    } else if (tasbeehButtonLabel == 'الحمد لله') {
      tasbeehButtonLabel = "لا إله إلا الله";
    } else if (tasbeehButtonLabel == "لا إله إلا الله") {
      tasbeehButtonLabel = 'الله اكبر';
    } else if (tasbeehButtonLabel == 'الله اكبر') {
      tasbeehButtonLabel = "لا حول ولا قوة إلا بالله";
    } else {
      tasbeehButtonLabel = 'سبحان الله';
    }
  }

  void incrementTasbeehCounter() {
    if (tasbeehCounter == 33) {
      tasbeehCounter = 0;
      changeTasbeehButtonDisplay();
    } else {
      tasbeehCounter++;
    }
    emit(TasbeehIncrement());
  }

  void resetTasbeehCounter() {
    tasbeehCounter = 0;
    emit(TasbeehReset());
  }
}
