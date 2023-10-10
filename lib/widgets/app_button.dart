import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Icon buttonIcon;

  const AppButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        overlayColor: MaterialStateProperty.all(Colors.red),
        shadowColor: MaterialStateProperty.all(Colors.greenAccent),
        elevation: MaterialStateProperty.all(3),
        padding: MaterialStateProperty.all(
            const EdgeInsets.fromLTRB(10, 10, 10, 10)),
        minimumSize: MaterialStateProperty.all(const Size(200, 40)),
        maximumSize: MaterialStateProperty.all(const Size(264, 46)),
        fixedSize: MaterialStateProperty.all(const Size(200, 40)),
        side: MaterialStateProperty.all(
          const BorderSide(
            color: Colors.greenAccent,
            width: 1,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        animationDuration: const Duration(milliseconds: 100),
        enableFeedback: true,
        alignment: Alignment.center,
        splashFactory: InkRipple.splashFactory,
      ),
      // style: ElevatedButton.styleFrom(
      //     backgroundColor: Colors.green,
      //     foregroundColor: Colors.white,
      //     shadowColor: Colors.greenAccent,
      //     elevation: 3,
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(32.0)),
      //     fixedSize: const Size(300, 40),
      //     textStyle: const TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold)),
      label: Text(label),
      icon: buttonIcon,
    );
  }
}
