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
  late List<bool> _selections;
  bool _isMultipleChoiceSelected = true;
  final List<Widget> _optionTextFields = [
    const Padding(padding: EdgeInsets.only(top: 12), child: MultipleChoiceOption())
  ];

  void _updateSelection(int index) {
    setState(() {
      _selections = List.generate(2, (i) => i == index);
      _isMultipleChoiceSelected = index == 0;
    });
  }

  void _addOption() {
    final key = UniqueKey();
    setState(() {
      _optionTextFields.add(
        Padding(key: key, padding: const EdgeInsets.only(top: 12), child: DeletableMultipleChoiceOption(onPressed: () {
          setState(() {
            _optionTextFields.removeWhere((widget) => widget.key == key);
          });
        }))
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _selections = List.generate(2, (index) => index == 0);
  }

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