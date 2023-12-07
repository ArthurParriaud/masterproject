import 'package:flutter/material.dart';

class LimitSetter extends StatefulWidget{

  final TextEditingController textEditingController;
  final bool hasError;
  final String hintText;

  const LimitSetter({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.hasError
  });

  @override
  State<LimitSetter> createState() => LimitSetterState();

}

class LimitSetterState extends State<LimitSetter>{

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.hasError
                  ? Colors.red
                  : Colors.grey,
              width: 2
          ),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02),
        child: TextFormField(
          controller: widget.textEditingController,
          onChanged: (value) {
            int cursorPos = widget.textEditingController.selection.extentOffset;
            widget.textEditingController.text = value;
            widget.textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: cursorPos));
          },
          decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none
          ),
        ),
      ),
    );
  }
}