import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:planeat_mobile_app/models/user_input.dart';
import 'package:planeat_mobile_app/screens/results_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double budget = 100;
  String skillLevel = "easy";
  double timeToCook = 60;
  int servings = 1;
  List<String> ingredToInclude = [];
  List<String> ingredAtHome = [];
  UserInput? newUserInput;

  final TextEditingController ingredIncludeController = TextEditingController();
  final TextEditingController ingredHomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: FittedBox(
            child: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'AlteHaasGrotesk',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              spacing: 5,
              children: [
                //WELCOME
                SizedBox(
                  height: 65,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          "What would you like to eat today Sir?",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),

                //BUDGET SLIDER
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 8),
                    child: Column(
                      spacing: 0,
                      children: [
                        FittedBox(
                          child: Text(
                            'Budget: ${budget.round()} kr',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Slider(
                          value: budget,
                          min: 20,
                          max: 300,
                          divisions: 28,
                          onChanged: (newValue) {
                            setState(() {
                              budget = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                //SKILL LEVEL BUTTON
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Skill level',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SegmentedButton<String>(
                              showSelectedIcon: false,
                              segments: const [
                                ButtonSegment(
                                  value: 'easy',
                                  label: Text('Easy'),
                                ),
                                ButtonSegment(
                                  value: 'medium',
                                  label: Text('Medium'),
                                ),
                                ButtonSegment(
                                  value: 'hard',
                                  label: Text('Hard'),
                                ),
                              ],
                              selected: {skillLevel},
                              onSelectionChanged: (selection) {
                                setState(() {
                                  skillLevel = selection.first;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //TIME SLIDER
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 8),
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text(
                            '${timeToCook.round()} min',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Slider(
                          value: timeToCook,
                          min: 5,
                          max: 120,
                          divisions: 23,
                          onChanged: (newValue) {
                            setState(() {
                              timeToCook = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                //INGREDIENTS TEXTFIELD
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsGeometry.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Column(
                      spacing: 5,
                      children: [
                        FittedBox(
                          child: Text(
                            'Ingredients',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextField(
                          controller: ingredIncludeController,
                          minLines: 1,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(height: 1.2),
                          decoration: const InputDecoration(
                            labelText: 'To include',
                            hintText: 'Enter',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 15,
                            ),
                          ),
                        ),
                        TextField(
                          controller: ingredHomeController,
                          minLines: 1,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          style: const TextStyle(height: 1.2),
                          decoration: const InputDecoration(
                            labelText: 'At home',
                            hintText: 'Enter',
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //SERVINGS SLIDER
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 5, 8, 8),
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text(
                            'Servings: ${servings.toString()}',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Slider(
                          value: servings.toDouble(),
                          min: 1,
                          max: 5,
                          divisions: 4,
                          onChanged: (newValue) {
                            setState(() {
                              servings = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                //CONTINUE
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ingredToInclude = ingredIncludeController.text
                              .replaceAll(" ", "")
                              .split(',')
                              .where((s) => s.isNotEmpty)
                              .toList();
                          ingredAtHome = ingredHomeController.text
                              .replaceAll(" ", "")
                              .split(',')
                              .where((s) => s.isNotEmpty)
                              .toList();

                          newUserInput = UserInput(
                            budget: budget,
                            skillLevel: skillLevel,
                            timeToCook: timeToCook,
                            servings: servings,
                            ingredToInclude: ingredToInclude,
                            ingredAtHome: ingredAtHome,
                          );

                          ingredIncludeController.clear();
                          ingredHomeController.clear();
                        });

                        if (newUserInput != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultsPage(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
