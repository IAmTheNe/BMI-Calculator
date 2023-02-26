// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bmi_cubit.dart';

class BmiState extends Equatable {
  const BmiState({
    this.age = 0,
    this.weight = 10,
    this.height = 20,
    this.gender = 0,
  });

  final int age;
  final int weight;
  final int height;
  final int gender;

  BmiState copyWith({
    int? age,
    int? weight,
    int? height,
    int? gender,
  }) {
    return BmiState(
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
    );
  }

  @override
  List<Object?> get props => [age, height, weight, gender];
}
