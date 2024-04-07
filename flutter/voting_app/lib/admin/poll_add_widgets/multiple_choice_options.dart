import 'package:flutter/material.dart';

class MultipleChoiceOption extends StatelessWidget {
  const MultipleChoiceOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Enter option...",
        filled: true,
        fillColor: const Color(0xFFEBEBEB),
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        color: Color(0xFF113143),
        fontSize: 14,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class DeletableMultipleChoiceOption extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController controller;
  const DeletableMultipleChoiceOption({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(key: key, children: [
      const Expanded(child: TextField(
        decoration: InputDecoration(
          hintText: 'Enter option...',
          filled: true,
          fillColor: Color(0xFFEBEBEB),
          contentPadding: EdgeInsets.all(12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            borderSide: BorderSide.none
          )
        ),
        style: TextStyle(
          color: Color(0xFF113143),
          fontSize: 14,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      )),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 3.2),
        decoration: const BoxDecoration(
          color: Color(0xFFFF5B5B),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: IconButton(
          icon: const Icon(Icons.delete, color: Colors.white),
          onPressed: onPressed
        ),
      ),
    ]);
  }
}
