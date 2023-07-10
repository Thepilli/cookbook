import 'package:flutter/material.dart';

class StepperHomePage extends StatefulWidget {
  const StepperHomePage({super.key});

  @override
  State<StepperHomePage> createState() => _StepperHomePageState();
}

class _StepperHomePageState extends State<StepperHomePage> {
  int _currentStep = 0;

  List<Step> stepList() => [
        Step(
          title: const Text('Step 1'),
          isActive: _currentStep >= 0,
          state: _currentStep <= 0 ? StepState.editing : StepState.complete, // StepState icon
          content: const Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Step 2'),
          isActive: _currentStep >= 1,
          state: _currentStep <= 1 ? StepState.editing : StepState.complete,
          content: const Text('This is step 2'),
        ),
        Step(
          title: const Text('Step 3'),
          isActive: _currentStep >= 2,
          state: _currentStep <= 2 ? StepState.editing : StepState.complete,
          content: const Text('This is step 3'),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stepper Widget')),
      body: Stepper(
        currentStep: _currentStep,
        steps: stepList(),
        type: StepperType.horizontal,
        elevation: 0,
        physics: const BouncingScrollPhysics(),
        onStepContinue: _currentStep < stepList().length - 1
            ? () {
                setState(() {
                  _currentStep += 1;
                });
              }
            : null,
        onStepCancel: _currentStep > 0
            ? () {
                setState(() {
                  _currentStep -= 1;
                });
              }
            : null,
        onStepTapped: (step) {
          // onTap
          setState(() {
            _currentStep = step;
          });
        },
      ),
    );
  }
}
