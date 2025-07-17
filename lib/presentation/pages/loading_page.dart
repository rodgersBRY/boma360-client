import 'package:client/config/theme/colors.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  final String? title;
  final String? subtitle;

  const LoadingPage({
    super.key,
    this.title = "Loading",
    this.subtitle = "Please wait while we prepare your content",
  });

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  late AnimationController _spinController;
  late AnimationController _pulseController;
  late AnimationController _dotsController;
  late AnimationController _progressController;
  late AnimationController _floatingController;

  late Animation<double> _spinAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<double> _progressAnimation;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    // Spin animation for the rings
    _spinController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();

    // Pulse animation for text
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Dots animation
    _dotsController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..repeat();

    // Progress animation
    _progressController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Floating shapes animation
    _floatingController = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);

    _spinAnimation = Tween<double>(begin: 0, end: 1).animate(_spinController);
    _pulseAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );
    _floatingAnimation = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _spinController.dispose();
    _pulseController.dispose();
    _dotsController.dispose();
    _progressController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.secondary],
          ),
        ),
        child: Stack(
          children: [
            // Background floating shapes
            _buildFloatingShapes(),

            // Main loading content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Multi-ring spinner
                  _buildSpinner(),

                  const SizedBox(height: 32),

                  // Loading text with pulse animation
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _pulseAnimation.value,
                        child: Text(
                          widget.title!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 16),

                  // Subtitle
                  Text(
                    widget.subtitle!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),

                  // Progress bar
                  _buildProgressBar(),

                  const SizedBox(height: 32),

                  // Bouncing dots
                  _buildBouncingDots(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpinner() {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        children: [
          // Outer ring
          AnimatedBuilder(
            animation: _spinAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _spinAnimation.value * 2 * 3.14159,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.8),
                      width: 4,
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.transparent],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Middle ring
          Positioned(
            top: 10,
            left: 10,
            child: AnimatedBuilder(
              animation: _spinController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: -_spinAnimation.value * 1.2 * 2 * 3.14159,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.danger.withValues(alpha: 0.1),
                        width: 3,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.textSecondary, AppColors.warning],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Inner ring
          Positioned(
            top: 20,
            left: 20,
            child: AnimatedBuilder(
              animation: _spinController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _spinAnimation.value * 0.8 * 2 * 3.14159,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.background.withValues(alpha: 0.1),
                        width: 2,
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF4ecdc4), Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Container(
      width: 200,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(2),
      ),
      child: AnimatedBuilder(
        animation: _progressAnimation,
        builder: (context, child) {
          return FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: _progressAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFff6b6b),
                    Color(0xFF4ecdc4),
                    Color(0xFF45b7d1),
                  ],
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBouncingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _dotsController,
          builder: (context, child) {
            final animationValue = (_dotsController.value + index * 0.16) % 1.0;
            final scale =
                animationValue < 0.4
                    ? 0.8 + (animationValue / 0.4) * 0.4
                    : animationValue < 0.8
                    ? 1.2 - ((animationValue - 0.4) / 0.4) * 0.4
                    : 0.8;

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildFloatingShapes() {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.1,
              child: Transform.translate(
                offset: Offset(0, _floatingAnimation.value),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.6,
              right: MediaQuery.of(context).size.width * 0.15,
              child: Transform.translate(
                offset: Offset(0, -_floatingAnimation.value),
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.2,
              child: Transform.translate(
                offset: Offset(0, _floatingAnimation.value * 0.5),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
