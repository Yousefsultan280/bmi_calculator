import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubitclass.dart';
import 'cubitstate.dart';

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BMICubit(),
      child: MaterialApp(
        home: BMICalculatorScreen(),
      ),
    );
  }
}

class BMICalculatorScreen extends StatelessWidget {
  const BMICalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: BlocBuilder<BMICubit, BMIState>(
        builder: (context, state) {
          final cubit = context.read<BMICubit>();

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => cubit.toggleGender(true),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: state.isMale ? Colors.deepPurple : Colors.grey,
                      child: Text("MALE"),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => cubit.toggleGender(false),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: !state.isMale ? Colors.deepPurple : Colors.grey,
                      child: Text("FEMALE"),
                    ),
                  ),
                ],
              ),

              Slider(
                value: state.height.toDouble(),
                min: 100,
                max: 220,
                onChanged: (val) => cubit.changeHeight(val.round()),
              ),
              Text("Height: ${state.height} cm"),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Weight: ${state.weight}"),
                      Row(
                        children: [
                          IconButton(
                              onPressed: cubit.decreaseWeight,
                              icon: Icon(Icons.remove)),
                          IconButton(
                              onPressed: cubit.increaseWeight,
                              icon: Icon(Icons.add)),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Age: ${state.age}"),
                      Row(
                        children: [
                          IconButton(
                              onPressed: cubit.decreaseAge,
                              icon: Icon(Icons.remove)),
                          IconButton(
                              onPressed: cubit.increaseAge,
                              icon: Icon(Icons.add)),
                        ],
                      )
                    ],
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {
                  cubit.calculateBMI();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text("BMI Result"),
                      content: Text(state.result),
                      actions: [
                        Text("Cancel"),
                        Text("Add")
                      ],
                    ),
                  );
                },
                child: Text("Check Your BMI"),
              ),
            ],
          );
        },
      ),
    );
  }
}