import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DrinkMenuItem extends StatelessWidget {
  const DrinkMenuItem(
      {Key? key, required this.isSelected, this.title = '', this.onPress})
      : super(key: key);
  final bool isSelected;
  final String title;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Bounce(
        delay: Duration(milliseconds: 800),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: 70,
          width: 100,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSelected
                ? Colors.red.withOpacity(.5)
                : Colors.white.withOpacity(.1),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.visible,
                  fontSize: 21,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
