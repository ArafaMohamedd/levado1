import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({required this.delay, required this.child});

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _translateYAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    final curvedOpacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut, // Adjust the curve here
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(curvedOpacityAnimation);

    _translateYAnimation = Tween<double>(begin: -30.0, end: 0.0)
        .animate(_controller);

    // تأخير بدء التحكم في الرسوم المتحركة باستخدام Future.delayed
    Future.delayed(Duration(milliseconds: (500 * widget.delay).round()), () {
      if (mounted) { // التحقق من أن الواجهة لم تتم تخريبها قبل استدعاء forward()
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform.translate(
          offset: Offset(0, _translateYAnimation.value),
          child: widget.child,
        ),
      ),
    );
  }
}
