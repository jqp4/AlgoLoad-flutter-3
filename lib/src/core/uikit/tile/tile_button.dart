import 'package:flutter/material.dart';
import 'package:algoload_flutter_web_app/src/core/_barrel.dart';

class StandartTileButton extends StatelessWidget {
  const StandartTileButton({
    required this.onPressed,
    this.child,
    super.key,
  });

  final void Function() onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    // todo: add material (?)
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: child ?? const SizedBox()),
            const Gap.x(16.0),
            const SizedBox.square(
              dimension: 24,
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: Color(0xFFB7B7B7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
