import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bmi_calculator/repositories/bmi/bmi_repository.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit(this._repository) : super(const BmiState());

  final BmiRepository _repository;

  chooseAge(int age) {}

  void chooseGender(int gender) {
    emit(state.copyWith(gender: gender));
  }

  void setHeight(double height) {
    emit(state.copyWith(height: height.toInt()));
  }

  void setWeight(double weight) {
    emit(state.copyWith(weight: weight.toInt()));
  }

  void reset() {
    emit(state.copyWith(
      height: 20,
      weight: 10,
    ));
  }

  String calculate() {
    return _repository.calculate(state.height, state.weight);
  }

  String result() {
    return _repository.result();
  }

  Color get color => _repository.color;
}
