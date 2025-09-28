import 'package:flutter_bloc/flutter_bloc.dart';

class BMIState {
  final int height;
  final int weight;
  final int age;
  final bool isMale;
  final String result;

  BMIState({
    this.height = 160,
    this.weight = 80,
    this.age = 30,
    this.isMale = false,
    this.result = '',
  });

  BMIState copyWith({
    int? height,
    int? weight,
    int? age,
    bool? isMale,
    String? result,
  }) {
    return BMIState(
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      isMale: isMale ?? this.isMale,
      result: result ?? this.result,
    );
  }
}
