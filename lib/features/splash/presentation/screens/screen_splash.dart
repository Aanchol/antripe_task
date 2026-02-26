import 'package:antripe_task/core/constants/app_color.dart';
import 'package:antripe_task/core/widgets/custom_button.dart';
import 'package:antripe_task/core/widgets/custom_text.dart';
import 'package:antripe_task/core/widgets/measurement.dart';
import 'package:flutter/material.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//
//   late AnimationController logoController;
//   late AnimationController circleController;
//
//   late Animation<double> logoScale;
//   late Animation<double> logoOpacity;
//
//   late Animation<Offset> topCircleOffset;
//   late Animation<Offset> bottomCircleOffset;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Logo Animation Controller
//     logoController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 900),
//     );
//
//     // Circle Animation Controller
//     circleController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1200),
//     );
//
//     // Scale & Opacity
//     logoScale = Tween<double>(begin: 0.8, end: 1.0).animate(
//       CurvedAnimation(parent: logoController, curve: Curves.easeOutBack),
//     );
//
//     logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: logoController, curve: Curves.easeIn),
//     );
//
//     // Circles sliding from edges
//     topCircleOffset = Tween<Offset>(
//       begin: const Offset(0.0, 0.0),
//       end: const Offset(-0.3, 1),
//     ).animate(CurvedAnimation(
//       parent: circleController,
//       curve: Curves.easeOut,
//     ));
//
//     bottomCircleOffset = Tween<Offset>(
//       begin: const Offset(0.3, -1),
//       end: const Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: circleController,
//       curve: Curves.easeOut,
//     ));
//
//     // Start animation sequence
//     circleController.forward();
//     Future.delayed(const Duration(milliseconds: 300), () {
//       logoController.forward();
//     });
//
//     // Navigate out
//     // Future.delayed(const Duration(seconds: 2), () {
//     //   Navigator.pushReplacementNamed(context, '/onboarding');
//     // });
//   }
//
//   @override
//   void dispose() {
//     logoController.dispose();
//     circleController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background gradient
//           Container(
//             decoration: BoxDecoration(
//               color: AppColors.white
//             ),
//           ),
//
//           // Circles Animation
//           SlideTransition(
//             position: topCircleOffset,
//             child: Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 width: 140,
//                 height: 140,
//                 decoration: const BoxDecoration(
//                   color: Color(0xFF098268),
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ),
//           SlideTransition(
//             position: bottomCircleOffset,
//             child: Transform.translate(
//             offset: const Offset(0, -100),
//               child: Align(
//                 alignment: Alignment.bottomLeft,
//                 child: Container(
//                   width: measurement.margin(353),
//                   height: measurement.margin(353),
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF098268),
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           // Logo Animation
//           Center(
//             child: FadeTransition(
//               opacity: logoOpacity,
//               child: ScaleTransition(
//                 scale: logoScale,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset(
//                       "assets/images/png/app_logo.png",
//                       width:measurement.margin(171) ,
//                       height:measurement.margin(168) ,
//                     ),
//                     const SizedBox(height: 8),
//                     const Text(
//                       "Make Life Easy",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.black54,
//                         fontWeight: FontWeight.w400,
//                         letterSpacing: 0.5,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  // Top circle slide out upward
  late AnimationController _topCircleCtrl;
  late Animation<Offset> _topCircleAnim;

  // Bottom circle slide out downward
  late AnimationController _bottomCircleCtrl;
  late Animation<Offset> _bottomCircleAnim;

  // Logo moves up
  late AnimationController _logoCtrl;
  late Animation<Offset> _logoMoveAnim;
  late Animation<double> _logoScaleAnim;


  // Bottom sheet slides up
  late AnimationController _sheetCtrl;
  late Animation<Offset> _sheetAnim;
  late Animation<double> _sheetFadeAnim;

  @override
  void initState() {
    super.initState();

    // 1. Circles hide (0ms → 800ms)
    _topCircleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _topCircleAnim = Tween<Offset>(begin: Offset.zero, end: const Offset(0, -2))
        .animate(
          CurvedAnimation(parent: _topCircleCtrl, curve: Curves.easeInCubic),
        );

    _bottomCircleCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _bottomCircleAnim =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 2)).animate(
          CurvedAnimation(parent: _bottomCircleCtrl, curve: Curves.easeInCubic),
        );

    // 2. Logo moves up + fades in properly (600ms → 1300ms)
    _logoCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _logoMoveAnim = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.35),
    ).animate(CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOutCubic));
    _logoScaleAnim = Tween<double>(begin: 1.0, end: 0.65)
        .animate(CurvedAnimation(parent: _logoCtrl, curve: Curves.easeOutCubic));
    // _logoFadeAnim = Tween<double>(
    //   begin: 1.0,
    //   end: 1.0,
    // ).animate(_logoCtrl); // stays visible

    // 3. Bottom sheet rises (900ms → 1500ms)
    _sheetCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _sheetAnim = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _sheetCtrl, curve: Curves.easeOutQuart));
    _sheetFadeAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _sheetCtrl, curve: Curves.easeIn));

    _startSequence();
  }

  Future<void> _startSequence() async {
    await Future.delayed(const Duration(milliseconds: 600));

    // Circles slide out simultaneously
    _topCircleCtrl.forward();
    _bottomCircleCtrl.forward();

    await Future.delayed(const Duration(milliseconds: 500));

    // Logo moves upward
    _logoCtrl.forward();

    await Future.delayed(const Duration(milliseconds: 300));

    // Bottom sheet rises
    _sheetCtrl.forward();
  }

  @override
  void dispose() {
    _topCircleCtrl.dispose();
    _bottomCircleCtrl.dispose();
    _logoCtrl.dispose();
    _sheetCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final circleR = measurement.width() * 0.42;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // ── Top-right decorative circle ──────────────────────────────────
          SlideTransition(
            position: _topCircleAnim,
            child: Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: Offset(circleR * 0.45, -circleR * 0.38),
                child: Container(
                  width: circleR * 1.5,
                  height: circleR * 1.5,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),

          // ── Bottom-left decorative circle ─────────────────────────────────
          SlideTransition(
            position: _bottomCircleAnim,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Transform.translate(
                offset: Offset(-circleR * 0.55, circleR * 0.45),
                child: Container(
                  width: circleR * 1.7,
                  height: circleR * 1.7,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.18),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),

          // ── Logo (centered, moves up) ─────────────────────────────────────
          SlideTransition(
            position: _logoMoveAnim,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    ScaleTransition(
                      scale: _logoScaleAnim,
                      child: Image.asset(
                        "assets/images/png/app_logo.png",
                        width: measurement.margin(171),
                        height: measurement.margin(168),
                      ),
                    ),
                ],
              ),
            ),
          ),

          // ── Bottom Welcome Sheet ──────────────────────────────────────────
          SlideTransition(
            position: _sheetAnim,
            child: FadeTransition(
              opacity: _sheetFadeAnim,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: measurement.width() * 0.08,
                    vertical: measurement.height() * 0.045,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(text:
                        'Welcome',
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: measurement.width() * 0.085,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                        ),
                      ),
                      SizedBox(height: measurement.height() * 0.018),
                      customText(text:
                      'Lorem ipsum dolor sit amet consectetur adipiscing elit. '
                        'Pellentesque fusce lobortis tincidunt vestibulum nisi '
                        'nulla egestas nibh diam tincidunt.',
                        textStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.72),
                          fontSize: measurement.width() * 0.033,
                          height: 1.55,
                        ),
                      ),
                      SizedBox(height: measurement.height() * 0.032),
                      CustomButton(
                        height: measurement.margin(56),
                        width: measurement.margin(326),
                        onTap: () {},
                        buttonText: 'Getting Started',
                        buttonColor: AppColors.white,
                        borderRadius: measurement.margin(40),
                        buttonTextStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: measurement.width() * 0.04,
                          letterSpacing: 0.5,
                        ),
                      ),
                      SizedBox(height: measurement.height() * 0.01),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
