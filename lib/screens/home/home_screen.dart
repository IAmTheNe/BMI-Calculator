import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'package:bmi_calculator/blocs/cubit/bmi_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentGender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Choose your gender',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/images/lady.svg',
                height: MediaQuery.of(context).size.height * 0.4,
                color: _currentGender != 0 ? Colors.grey[200] : null,
              ),
              SvgPicture.asset(
                'assets/images/boy.svg',
                height: MediaQuery.of(context).size.height * 0.4,
                color: _currentGender != 1 ? Colors.grey[200] : null,
              ),
            ],
          ),
          Center(
            child: ToggleSwitch(
              initialLabelIndex: _currentGender,
              labels: const ['Female', 'Male'],
              radiusStyle: true,
              cornerRadius: 90,
              activeBgColors: const [
                [Colors.pink],
                [Colors.blue],
              ],
              customIcons: const [
                Icon(
                  Icons.female,
                  color: Colors.white,
                ),
                Icon(
                  Icons.male,
                  color: Colors.white,
                ),
              ],
              inactiveFgColor: Colors.grey.shade100,
              animate: true,
              animationDuration: 500,
              curve: Curves.easeInOutQuad,
              minWidth: MediaQuery.of(context).size.width * 0.4,
              onToggle: (val) {
                setState(() {
                  _currentGender = val!;
                });
              },
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<BmiCubit>().chooseGender(_currentGender);
              Navigator.pushNamed(context, '/info');
            },
            backgroundColor: _currentGender == 0
                ? Colors.pink.shade300
                : Colors.blue.shade300,
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
