import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:bmi_calculator/blocs/cubit/bmi_cubit.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});

  static const routeName = '/info';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your height and weight',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SfLinearGauge(
                        minimum: 10,
                        maximum: 150,
                        orientation: LinearGaugeOrientation.vertical,
                        ranges: [
                          LinearGaugeRange(
                            endValue: state.weight.toDouble(),
                            color: state.gender == 0
                                ? Colors.pink.shade200
                                : Colors.blue.shade200,
                            position: LinearElementPosition.cross,
                          )
                        ],
                        markerPointers: [
                          LinearShapePointer(
                            value: state.weight.toDouble(),
                            onChanged: (value) {
                              context.read<BmiCubit>().setWeight(value);
                            },
                            shapeType: LinearShapePointerType.diamond,
                            color: state.gender == 0
                                ? Colors.pink.shade500
                                : Colors.blue.shade500,
                            position: LinearElementPosition.cross,
                          ),
                          LinearWidgetPointer(
                            value: state.weight.toDouble(),
                            onChanged: (value) {
                              context.read<BmiCubit>().setWeight(value);
                            },
                            position: LinearElementPosition.outside,
                            child: SizedBox(
                              width: 30,
                              child: Text(
                                state.weight.toDouble().floor().toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: state.gender == 0
                                      ? Colors.pink.shade500
                                      : Colors.blue.shade500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Weight (Kg)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    state.gender == 0
                        ? 'assets/images/lady.svg'
                        : 'assets/images/boy.svg',
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Column(
                    children: [
                      SfLinearGauge(
                        minimum: 20,
                        maximum: 200,
                        orientation: LinearGaugeOrientation.vertical,
                        ranges: [
                          LinearGaugeRange(
                            endValue: state.height.toDouble(),
                            color: state.gender == 0
                                ? Colors.pink.shade200
                                : Colors.blue.shade200,
                            position: LinearElementPosition.cross,
                          ),
                        ],
                        markerPointers: [
                          LinearShapePointer(
                            value: state.height.toDouble(),
                            onChanged: (value) {
                              context.read<BmiCubit>().setHeight(value);
                            },
                            shapeType: LinearShapePointerType.diamond,
                            color: state.gender == 0
                                ? Colors.pink.shade500
                                : Colors.blue.shade500,
                            position: LinearElementPosition.cross,
                          ),
                          LinearWidgetPointer(
                            value: state.height.toDouble(),
                            onChanged: (value) {
                              context.read<BmiCubit>().setHeight(value);
                            },
                            position: LinearElementPosition.outside,
                            child: SizedBox(
                              width: state.height < 100 ? 30 : 35,
                              child: Text(
                                state.height.toDouble().floor().toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: state.gender == 0
                                      ? Colors.pink.shade500
                                      : Colors.blue.shade500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Height (cm)',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/result');
                },
                backgroundColor: state.gender == 0
                    ? Colors.pink.shade300
                    : Colors.blue.shade300,
                child: const Icon(
                  Icons.arrow_forward,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
