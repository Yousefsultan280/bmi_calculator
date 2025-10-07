class BMIState {
  final int height;
  final int weight;
  final int age;
  final bool isMale;
  final String result;

  BMIState({
    this.height = 183,
    this.weight = 73,
    this.age = 21,
    this.isMale = true,
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
