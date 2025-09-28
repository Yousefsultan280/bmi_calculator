import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubitstate.dart';

class BMICubit extends Cubit<BMIState> {
  BMICubit() : super(BMIState());

  void toggleGender(bool male) {
    emit(state.copyWith(isMale: male));
  }

  void changeHeight(int h) {
    emit(state.copyWith(height: h));
  }

  void increaseWeight() {
    emit(state.copyWith(weight: state.weight + 1));
  }

  void decreaseWeight() {
    emit(state.copyWith(weight: state.weight - 1));
  }

  void increaseAge() {
    emit(state.copyWith(age: state.age + 1));
  }

  void decreaseAge() {
    emit(state.copyWith(age: state.age - 1));
  }

  void calculateBMI() {
    var bmi = state.weight / (state.height * state.height) * 10000;
    String result;
    if (bmi < 18.5) {
      result = "Underweight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      result = "Normal weight";
    } else if (bmi >= 25 && bmi <= 29.9) {
      result = "Overweight";
    } else {
      result = "Obese";
    }

    emit(state.copyWith(result: result));
  }
}