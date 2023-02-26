import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'package:bmi_calculator/blocs/cubit/bmi_cubit.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Your BMI Result',
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
        builder: (context, state) => Column(
          children: [
            SfRadialGauge(
              enableLoadingAnimation: true,
              axes: [
                RadialAxis(
                  showAxisLine: false,
                  showTicks: false,
                  showLabels: false,
                  startAngle: 180,
                  endAngle: 360,
                  canScaleToFit: true,
                  minimum: 10,
                  radiusFactor: 0.9,
                  maximum: 40,
                  ranges: [
                    GaugeRange(
                      startValue: 10,
                      endValue: 18.5,
                      color: Colors.green,
                      label: 'Underweight',
                      labelStyle: const GaugeTextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: .4,
                      endWidth: .4,
                    ),
                    GaugeRange(
                      startValue: 18.5,
                      endValue: 25,
                      color: Colors.blue,
                      label: 'Normal',
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: .4,
                      endWidth: .4,
                      labelStyle: const GaugeTextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GaugeRange(
                      startValue: 25,
                      endValue: 30,
                      color: Colors.yellow,
                      label: 'Overweight',
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: .4,
                      endWidth: .4,
                      labelStyle: const GaugeTextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GaugeRange(
                      startValue: 30,
                      endValue: 50,
                      color: Colors.red,
                      label: 'Obese',
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: .4,
                      endWidth: .4,
                      labelStyle: const GaugeTextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                  pointers: [
                    NeedlePointer(
                      value: double.parse(context.read<BmiCubit>().calculate()),
                      needleLength: 0.7,
                      knobStyle: const KnobStyle(
                        knobRadius: 12,
                        sizeUnit: GaugeSizeUnit.logicalPixel,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.read<BmiCubit>().calculate(),
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: context.read<BmiCubit>().color),
                ),
                const SizedBox(
                  width: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                      ),
                    ),
                    Text(
                      context.read<BmiCubit>().result(),
                      style: TextStyle(
                        letterSpacing: .4,
                        fontWeight: FontWeight.bold,
                        color: context.read<BmiCubit>().color.withOpacity(.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .15,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/');
                  context.read<BmiCubit>().reset();
                },
                backgroundColor: context.read<BmiCubit>().color,
                child: const Icon(Icons.replay),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
