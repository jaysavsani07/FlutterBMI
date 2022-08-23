import 'package:bmi_calculator/core/constants.dart';

class Bmi {
  final int age;
  final Weight weight;
  final Height height;
  final Gender gender;

  Bmi({
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
  });

  factory Bmi.initial() {
    return Bmi(
      age: 18,
      weight: Weight.initial(),
      height: Height.initial(),
      gender: Gender.Female,
    );
  }

  Bmi copyWith({
    int? age,
    Weight? weight,
    Height? height,
    Gender? gender,
  }) {
    return Bmi(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
    );
  }
}

class Weight {
  final bool isKg;
  final int weight;

  Weight({
    required this.isKg,
    required this.weight,
  });

  factory Weight.initial() {
    return Weight(
      isKg: true,
      weight: 50,
    );
  }

  Weight copyWith({
    bool? isKg,
    int? weight,
  }) {
    return Weight(
      isKg: isKg ?? this.isKg,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "is_kg": isKg,
      "weight": weight,
    };
  }

  factory Weight.fromJson({required Map<String, dynamic> json}) {
    return Weight(
      isKg: json["is_kg"],
      weight: json["weight"],
    );
  }
}

class Height {
  final bool isCm;
  final int height;
  final int feet;
  final int inch;

  Height({
    required this.isCm,
    required this.height,
    required this.feet,
    required this.inch,
  });

  factory Height.initial() {
    return Height(
      isCm: true,
      height: 170,
      feet: 4,
      inch: 8,
    );
  }

  Height copyWith({
    bool? isCm,
    int? height,
    int? feet,
    int? inch,
  }) {
    return Height(
      isCm: isCm ?? this.isCm,
      height: height ?? this.height,
      feet: feet ?? this.feet,
      inch: inch ?? this.inch,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "is_cm": isCm,
      "height": height,
      "feet": feet,
      "inch": inch,
    };
  }

  factory Height.fromJson({required Map<String, dynamic> json}) {
    return Height(
      isCm: json["is_cm"],
      height: json["height"],
      feet: json["feet"],
      inch: json["inch"],
    );
  }
}
