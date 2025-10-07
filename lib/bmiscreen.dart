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
        debugShowCheckedModeBanner: false,
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
      backgroundColor: const Color.fromARGB(255, 133, 105, 180),
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: BlocBuilder<BMICubit, BMIState>(
        builder: (context, state) {
          final cubit = context.read<BMICubit>();

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black,width: 1.2),color:Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => cubit.toggleGender(true),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: state.isMale ? Colors.deepPurple : Colors.grey,
                          child: Text(
                            "MALE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => cubit.toggleGender(false),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          color: !state.isMale ? Colors.deepPurple : Colors.grey,
                          child: Text(
                            "FEMALE",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            SizedBox(height: 20,),
                Container(
                   height: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black,width: 1.2),color:Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height: ${state.height} cm"),
                      Slider(
                        value: state.height.toDouble(),
                        min: 100,
                        max: 220,
                        onChanged: (val) => cubit.changeHeight(val.round()),  
                      ),
                      
                    ],
                  ),
                ),
                
            SizedBox(height: 20,),
                Container(
                   height: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black,width: 1.2),color:Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Weight: ${state.weight}"),
                          Row(
                            children: [
                              IconButton(
                                onPressed: cubit.decreaseWeight,
                                icon: Icon(Icons.remove),
                              ),
                              IconButton(
                                onPressed: cubit.increaseWeight,
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age: ${state.age}"),
                          Row(
                            children: [
                              IconButton(
                                onPressed: cubit.decreaseAge,
                                icon: Icon(Icons.remove),
                              ),
                              IconButton(
                                onPressed: cubit.increaseAge,
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    cubit.calculateBMI();
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text("BMI Result"),
                        content: Text(state.result),
                        actions: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          Text("ok"),
                        ],
                      ),
                    );
                  },
                  child: Text("Check Your BMI"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
