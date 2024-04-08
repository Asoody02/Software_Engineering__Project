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
  late List<TextEditingController> _optionControllers = [];
  late TextEditingController _questionController;
  late List<bool> _selections;
  bool _isMultipleChoiceSelected = true;
  final List<Widget> _optionTextFields = [
     Padding(padding: EdgeInsets.only(top: 12), child: MultipleChoiceOption(controller: TextEditingController()))
  ];

  void _updateSelection(int index) {
    setState(() {
      _selections = List.generate(2, (i) => i == index);
      _isMultipleChoiceSelected = index == 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _selections = List.generate(2, (index) => index == 0);
    _questionController = TextEditingController();
    _addOption(); // Initialize with one option
  }

void _addOption() {
  setState(() {
    final key = UniqueKey();
    _optionTextFields.add(
      Padding(
        key: key,
        padding: const EdgeInsets.only(top: 12),
        child: DeletableMultipleChoiceOption(
          controller: TextEditingController(),
          onPressed: () {
            setState(() {
              _optionTextFields.removeWhere((widget) => widget.key == key);
            });
          },
        ),
      ),
    );
    _optionControllers.add(TextEditingController());
  });
}

  Map<String, dynamic> getQuestionData() {
    List<String> options = _optionControllers.map((controller) => controller.text).toList();
    return {
      "questionText": _questionController.text,
      "options": options,
    };
  }

  @override
  void dispose() {
    _questionController.dispose();
    for (var controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  return Padding(
    key: widget.key,
    padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
    child: Container(
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
              ),
            ),
            Visibility(
              visible: (widget.questionNumber != 1),
              maintainSize: false,
              maintainState: true,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF5B5B),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: widget.onPressed,
                  ),
                ),
              ),
            ),
          ]),
          TextField(
            controller: _questionController,
            decoration: const InputDecoration(
              hintText: 'Enter question...',
              prefixIcon: Icon(Icons.edit, color: Color(0xFF113143), size: 20),
            ),
            style: const TextStyle(
              color: Color(0xFF113143),
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
            ),
          ),
          // Toggle buttons and other UI elements remain unchanged
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
          // Dynamically generate option fields
          Visibility(
            visible: _isMultipleChoiceSelected,
            maintainSize: false,
            maintainState: true,
            child: Column(
              children: [
                for (var controller in _optionControllers) // Generate option fields dynamically
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: DeletableMultipleChoiceOption(
                      controller: controller,
                      onPressed: () {
                        setState(() {
                          _optionControllers.remove(controller);
                          controller.dispose();
                        });
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: TextButton(
                    onPressed: _addOption,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF5AC7F0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                    ),
                    child: const Text('Add Option', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}