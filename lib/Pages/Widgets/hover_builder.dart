import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_effect/Providers/animation_provider.dart';

class HoverBuilder extends StatelessWidget {
  const HoverBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(bool isHovered) builder;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) =>
          Provider.of<AnimationProvider>(context, listen: false)
              .setHovered(true),
      onExit: (PointerExitEvent event) =>
          Provider.of<AnimationProvider>(context, listen: false)
              .setHovered(false),
      child: Consumer<AnimationProvider>(
        builder: (context, value, child) => builder(value.ishoverd),
      ),
    );
  }
}
