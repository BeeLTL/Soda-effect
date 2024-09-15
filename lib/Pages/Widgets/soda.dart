import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:soda_effect/Pages/Widgets/hover_builder.dart';

import 'dart:ui' as ui;

import 'package:soda_effect/Utils/device/size_config.dart';

class Soda extends StatefulWidget {
  const Soda({super.key});

  @override
  State<Soda> createState() => _SodaState();
}

class _SodaState extends State<Soda> with SingleTickerProviderStateMixin {
  late Animation<Alignment> alignmentAnimation;
  late Animation<Offset> translationAnimation;
  late Animation<double> opacityAnimation;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    alignmentAnimation = Tween<Alignment>(
      begin: Alignment(-1, 0),
      end: Alignment(1.01, 0),
    ).animate(animationController)
      ..addListener(() {
        setState(
            () {}); // Add this line to update the state on animation value change
      });

    translationAnimation = Tween<Offset>(
      begin: Offset(0, 0), // initial translation value
      end: Offset(0, -100), // final translation value
    ).animate(animationController)
      ..addListener(() {
        setState(() {}); // update the state on animation value change
      });

    opacityAnimation = Tween<double>(
      begin: 0.0, // initial opacity
      end: 1, // final opacity
    ).animate(animationController)
      ..addListener(() {
        setState(() {}); // update the state on animation value change
      });
  }

  @override
  Widget build(BuildContext context) {
    return HoverBuilder(builder: (isHovered) {
      if (isHovered) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      return Transform.translate(
        offset: translationAnimation.value,
        child: Container(
          width: 280,
          child: Stack(children: [
            Image.asset(
              "Assets/Images/mockup.png",
            ),
            BlendMask(
              blendMode: BlendMode.multiply,
              maskImage:
                  AssetImage("Assets/Images/mockup.png"), // Mask as image
              child: Image.asset(
                "Assets/Images/bg.png",
                alignment:
                    isHovered ? alignmentAnimation.value : Alignment(-1, 0),
                fit: BoxFit.fitHeight,
                height: SizeConfig.blockSizeVertical * 56,
              ),
            ),
            Image.asset("Assets/Images/mockup.png", opacity: opacityAnimation),
            BlendMask(
              blendMode: BlendMode.multiply,
              maskImage:
                  AssetImage("Assets/Images/mockup.png"), // Mask as image
              child: Image.asset(
                "Assets/Images/bg2.png",
                opacity: opacityAnimation,
                alignment:
                    isHovered ? alignmentAnimation.value : Alignment(-1, 0),
                fit: BoxFit.fitHeight,
                height: SizeConfig.blockSizeVertical * 56,
              ),
            ),
          ]),
        ),
      );
    });
  }
}

class BlendMask extends SingleChildRenderObjectWidget {
  final BlendMode blendMode;
  final double opacity;
  final ImageProvider maskImage; // Mask as an image

  const BlendMask({
    required this.blendMode,
    required this.maskImage, // Add mask image
    this.opacity = 1.0,
    super.key,
    super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderBlendMask(blendMode, opacity, maskImage);
  }

  @override
  void updateRenderObject(BuildContext context, RenderBlendMask renderObject) {
    renderObject.blendMode = blendMode;
    renderObject.opacity = opacity;
    renderObject.maskImage = maskImage; // Update mask image
  }
}

class RenderBlendMask extends RenderProxyBox {
  BlendMode blendMode;
  double opacity;
  ImageProvider maskImage;
  ui.Image? _maskImage; // Cache the loaded mask image

  RenderBlendMask(this.blendMode, this.opacity, this.maskImage) {
    _loadMaskImage();
  }

  // Load the mask image asynchronously
  void _loadMaskImage() {
    maskImage.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool synchronousCall) {
        _maskImage = info.image;
        markNeedsPaint(); // Repaint when the mask is loaded
      }),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (_maskImage == null) {
      // If the mask image is not yet loaded, paint the child normally
      super.paint(context, offset);
      return;
    }

    // Create a new layer with blend mode and opacity
    context.canvas.saveLayer(
      offset & size,
      Paint()
        ..blendMode = blendMode
        ..color = Color.fromARGB((opacity * 255).round(), 255, 255, 255),
    );

    // Paint the child first
    super.paint(context, offset);

    // Apply the mask image on top of the child
    Paint maskPaint = Paint()
      ..blendMode = BlendMode.dstIn; // Blend the mask with the child
    context.canvas.drawImageRect(
      _maskImage!,
      Rect.fromLTWH(
          0, 0, _maskImage!.width.toDouble(), _maskImage!.height.toDouble()),
      offset & size,
      maskPaint,
    );

    context.canvas.restore(); // Restore the layer
  }
}
