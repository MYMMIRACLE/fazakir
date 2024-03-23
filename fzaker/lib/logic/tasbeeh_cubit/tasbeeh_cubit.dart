import 'package:bloc/bloc.dart';
import 'package:fazakir/core/cache/cache.dart';
import 'package:meta/meta.dart';

part 'tasbeeh_state.dart';

class TasbeehCubit extends Cubit<TasbeehState> {
  TasbeehCubit() : super(TasbeehInitial());
  int previousTasbeehCounter = 0;
  String tasbeehButtonLabel = 'سبحان الله';
  int tasbeehCounter = 0;
  dynamic res = 0;
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

  void incrementTasbeehCounter() async {
    if (tasbeehCounter == 33) {
      tasbeehCounter = 0;
      if (CacheData.getdata(key: 'tasbeeh') == null) {
        res = await CacheData.setData(key: 'tasbeeh', value: 1);
        emit(TasbeehLastResult(tasbeehCounter: res));
      } else {
        res = await CacheData.setData(
            key: 'tasbeeh', value: CacheData.getdata(key: 'tasbeeh') + 1);
        emit(TasbeehLastResult(tasbeehCounter: res));
      }
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
