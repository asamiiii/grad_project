import 'package:flutter/material.dart';
import 'package:grad_project/utils/size_helper.dart';
import 'package:grad_project/widgets/close_button.dart';

class LettersTopBar extends StatelessWidget {
  const LettersTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        XCloseButton(),
        SizeHelper.expandedSpace(),
        Image.asset('assets/images/audio.png'),
        SizeHelper.horizontalSpace(10),
        Image.asset('assets/images/refresh.png'),
        SizeHelper.horizontalSpace(10),
        const MenuButton(),
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Image.asset('assets/images/menu.png'));
  }
}