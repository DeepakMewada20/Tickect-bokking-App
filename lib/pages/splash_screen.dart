
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceInOut,
    );
    _animationController.forward();

    // Timer(
    //   const Duration(milliseconds: 2500),
    //   () => Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (_) => const LoginScreen(),
    //     ),
    //   ),
    // );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      //backgroundColor: MyTheme.splash,
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: ScaleTransition(
            scale: _animation,
            child: RichText(
              text:const TextSpan(
                children: [
                  TextSpan(
                    text:"BOOK",
                    style: TextStyle(color: Color.fromARGB(213, 246, 152, 12),fontSize: 45), 
                  ),
                  TextSpan(
                    text: "KARO",
                    style: TextStyle(color: Colors.white,fontSize: 45),
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
