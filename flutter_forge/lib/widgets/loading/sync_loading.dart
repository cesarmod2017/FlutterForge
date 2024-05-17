import 'dart:math';

import 'package:flutter_forge/exports/basic_exports.dart';

class SyncLoading extends StatefulWidget {
  const SyncLoading({super.key});

  @override
  State<SyncLoading> createState() => _SyncLoadingState();
}

class _SyncLoadingState extends State<SyncLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5), // ajuste a duração conforme desejar
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose(); // não se esqueça de fazer a limpeza!
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 4 * pi, // rotação em radianos
          child: child,
        );
      },
      child: const Icon(
        FontAwesomeIcons.arrowsRotate,
        color: greyColor,
      ),
    );
  }
}
