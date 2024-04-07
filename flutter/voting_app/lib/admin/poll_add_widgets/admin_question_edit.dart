import 'package:flutter/material.dart';
import 'package:voting_app/admin/poll_add_widgets/multiple_choice_options.dart';

class QuestionEdit extends StatefulWidget {
  final int questionNumber;
  final VoidCallback? onPressed;

  const QuestionEdit({
    Key? key,
    required this.questionNumber,
    this.onPressed
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => QuestionEditState();
}

class QuestionEditState extends State<QuestionEdit> {
  late TextEditingController _questionController;
  final List<TextEditingController> _optionControllers = [];
  late List<bool> _selections;
  bool _isMultipleChoiceSelected = true;
  final List<Widget> _optionTextFields = [
    const Padding(padding: EdgeInsets.only(top: 12), child: MultipleChoiceOption())
  ];

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController();
    _optionControllers.add(TextEditingController());
    _selections = List.generate(2, (index) => index == 0);
  }

  @override
  void dispose() {
    _questionController.dispose();
    _optionControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  void _updateSelection(int index) {
    setState(() {
      _selections = List.generate(2, (i) => i == index);
      _isMultipleChoiceSelected = index == 0;
    });
  }

void _addOption() {
  setState(() {
    // Create a new controller for the new option
    final TextEditingController newController = TextEditingController();
    // Create a unique key for the new option for identification
    final UniqueKey key = UniqueKey();

    // Add the new option widget along with its controller
    _optionTextFields.add(
      Padding(
        key: key,
        padding: const EdgeInsets.only(top: 12),
        child: DeletableMultipleChoiceOption(
          controller: newController, // Pass the controller to the widget
          onPressed: () {
            setState(() {
              // Find the position of the widget to delete
              final indexToRemove = _optionTextFields.indexWhere((widget) => widget.key == key);
              if (indexToRemove != -1) {
                // Remove the controller and widget based on index
                _optionControllers.removeAt(indexToRemove);
                _optionTextFields.removeAt(indexToRemove);
              }
            });
          },
        ),
      ),
    );

    // Keep track of this controller for later form submission
    _optionControllers.add(newController);
  });
}

  // Method to get the question data
  Map<String, dynamic> getQuestionData() {
    return {
      'question_text': _questionController.text,
      'is_multiple_choice': _isMultipleChoiceSelected,
      // Add additional data as needed
    };
  }
  
  // @override
  // void initState() {
  //   super.initState();
  //   _selections = List.generate(2, (index) => index == 0);
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(key: widget.key, padding: const EdgeInsets.only(top: 12, left: 12, right: 12), child: Container(
      padding: const EdgeInsets.all(20),
      width: 313,
      decoration: ShapeDecoration(
        color: const Color(0xFFC7E7F3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Question ${widget.questionNumber}',
              style: const TextStyle(
                color: Color(0xFF113143),
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
              )
            ),

            //the delete button is only visible if it isn't the first question
            Visibility(
              visible: (widget.questionNumber != 1),
              maintainSize: false,
              maintainState: true,
              child: Align(alignment: Alignment.topRight, child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFF5B5B),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: widget.onPressed
                ),
              ))
            )
          ]),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Enter question...',
              prefixIcon: Icon(Icons.edit, color: Color(0xFF113143), size: 20)
            ),
            style: TextStyle(
              color: Color(0xFF113143),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            )
          ),

          Align(alignment: Alignment.center, child: 
            Padding(padding: const EdgeInsets.only(top: 25), child: Container( 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFEBEBEB)
              ),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFF757575),
                selectedColor: const Color(0xFFFFFFFF),
                fillColor: const Color(0xFF5AC7F0),
                isSelected: _selections,
                onPressed: (index) {
                  _updateSelection(index);
                },
                children: const [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text(
                    'Multiple Choice',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    )
                  )),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text(
                    'Short Answer',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                    )
                  ))
                ]
              )
            )
          )),

          //multiple choice options are only visible if short answer toggle isn't selected
          Visibility(
            visible: _isMultipleChoiceSelected,
            maintainSize: false,
            maintainState: true,
            child: Column(children: [
              Column(children: _optionTextFields),
              Padding(padding: const EdgeInsets.only(top: 12), child: TextButton(
                onPressed: _addOption,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
                ),
                child: const Text('Add Option', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))
              ))
            ])
          )
        ]
      ),
    ));
  }
}