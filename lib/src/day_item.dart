import 'package:flutter/material.dart';

/// Creates a Widget representing the day.
class DayItem extends StatelessWidget {
  const DayItem({
    Key? key,
    required this.dayNumber,
    required this.shortName,
    required this.onTap,
    this.isSelected = false,
    this.dayColor,
    this.activeDayColor,
    this.activeDayBackgroundColor,
    this.available = true,
    this.dotsColor,
    this.dayNameColor,
    this.shrink = false,
  }) : super(key: key);
  final int dayNumber;
  final String shortName;
  final bool isSelected;
  final Function onTap;
  final Color? dayColor;
  final Color? activeDayColor;
  final Color? activeDayBackgroundColor;
  final bool available;
  final Color? dotsColor;
  final Color? dayNameColor;
  final bool shrink;

  GestureDetector _buildDay(BuildContext context) {
    final textStyle = TextStyle(
      color: available
          ? dayColor ?? Theme.of(context).colorScheme.secondary
          : dayColor?.withOpacity(0.5) ??
              Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      fontSize: shrink ? 14 : 32,
      fontWeight: FontWeight.normal,
    );
    final selectedStyle = TextStyle(
      color: activeDayColor ?? Colors.white,
      fontSize: shrink ? 14 : 32,
      fontWeight: FontWeight.bold,
      height: 0.8,
    );

    return GestureDetector(
      onTap: available ? onTap as void Function()? : null,
      child: Container(
        decoration: isSelected
            ? BoxDecoration(
                color: activeDayBackgroundColor ??
                    Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              )
            : BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    width: 1,
                    color: dayColor ?? Theme.of(context).colorScheme.secondary),
                borderRadius: BorderRadius.circular(12.0)),
        height: shrink ? 40 : 70,
        width: shrink ? 33 : 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isSelected) ...[
              SizedBox(height: shrink ? 6 : 7),
            ],
            Text(
              dayNumber.toString(),
              style: isSelected ? selectedStyle : textStyle,
            ),
            if (isSelected)
              Text(
                shortName,
                style: TextStyle(
                  color: dayNameColor ?? activeDayColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: shrink ? 9 : 14,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDots() {
    final dot = Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        color: dotsColor ?? activeDayColor ?? Colors.white,
        shape: BoxShape.circle,
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [dot, dot],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildDay(context);
  }
}
