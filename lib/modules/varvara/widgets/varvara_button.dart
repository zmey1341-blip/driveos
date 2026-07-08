import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/varvara_service.dart';

class VarvaraButton extends ConsumerStatefulWidget {
  const VarvaraButton({Key? key}) : super(key: key);

  @override
  ConsumerState<VarvaraButton> createState() => _VarvaraButtonState();
}

class _VarvaraButtonState extends ConsumerState<VarvaraButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPressed() {
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: FloatingActionButton.large(
        backgroundColor: const Color(0xFF1E88E5),
        onPressed: _onPressed,
        child: const Icon(
          Icons.mic,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
