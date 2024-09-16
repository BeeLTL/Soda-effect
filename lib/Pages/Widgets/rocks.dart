import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_effect/Providers/animation_provider.dart';
import 'package:soda_effect/Utils/device/size_config.dart';

class Rocks extends StatefulWidget {
  const Rocks({super.key});

  @override
  State<Rocks> createState() => _RocksState();
}

class _RocksState extends State<Rocks> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Alignment> alignmentAnimationrock1;
  late Animation<Alignment> alignmentAnimationrock2;
  late Animation<Alignment> alignmentAnimationrock3;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 430),
      vsync: this,
    );
    alignmentAnimationrock1 = Tween<Alignment>(
      begin: const Alignment(0.0, 0.8), // initial translation value
      end: const Alignment(0.0, 0.89), // final translation value for rock1
    ).animate(animationController)
      ..addListener(() {
        setState(() {}); // update the state on animation value change
      });

    alignmentAnimationrock2 = Tween<Alignment>(
      begin: const Alignment(-1.0, 1.09), // initial translation value
      end: const Alignment(-1.1, 1.2), // final translation value for rock2
    ).animate(animationController)
      ..addListener(() {
        setState(() {}); // update the state on animation value change
      });

    alignmentAnimationrock3 = Tween<Alignment>(
      begin: const Alignment(1.0, 1.4), // initial translation value
      end: const Alignment(1.1, 1.6), // final translation value for rock3
    ).animate(animationController)
      ..addListener(() {
        setState(() {}); // update the state on animation value change
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final animationProvider = Provider.of<AnimationProvider>(context);
    if (animationProvider.ishoverd) {
      animationController.forward();
    } else {
      animationController.reverse();
    }

    return Stack(
      children: [
        Align(
          alignment: alignmentAnimationrock1.value,
          child: Image.asset(
            "Assets/Images/rock1.png",
          ),
        ),
        Align(
          alignment: alignmentAnimationrock2.value,
          child: Image.asset(
            "Assets/Images/rock2.png",
            height: SizeConfig.blockSizeVertical * 50,
            fit: BoxFit.contain,
          ),
        ),
        Align(
          alignment: alignmentAnimationrock3.value,
          child: Transform.rotate(
            angle: -25.6,
            child: Image.asset(
              "Assets/Images/rock3.png",
              fit: BoxFit.fill,
              height: SizeConfig.blockSizeVertical * 60,
            ),
          ),
        ),
      ],
    );
  }
}
