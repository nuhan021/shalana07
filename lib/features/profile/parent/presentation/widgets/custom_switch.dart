import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  final bool value; // controlled value
  final ValueChanged<bool> onChanged;
  final double? height;
  final Color? color;
  final double? width;
  final double? padding;
  final double? toggle;
  const CustomToggle({
    super.key,
    required this.value,
    required this.onChanged,
    this.height,
    this.color,
    this.width,
    this.padding,
    this.toggle,
  });

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          widget.onChanged(!widget.value), // only notify parent, no local state
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        width: widget.width ?? 60,
        height: widget.height ?? 32,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: widget.value
              ? widget.color ?? const Color(0xFF60B242)
              : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: widget.value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            width:widget.toggle ?? 24,
            height: widget.toggle ?? 24,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
