import 'package:arm_health/config/asset.dart';
import 'package:arm_health/config/color.dart';
import 'package:arm_health/page/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _progressValue = 0.0;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animationController.addListener(() {
      setState(() {
        _progressValue = _animationController.value;
      });
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigasi ke halaman selanjutnya setelah animasi selesai
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
    _startAnimation();
  }

  void _startAnimation() {
    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AssetConfig.bg), fit: BoxFit.fill)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image.asset(
                AssetConfig.logo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "D4 TEKNIK MEKATRONIKA",
              style: TextStyle(
                color: Colorconfig.fonttitle,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "POLITEKNIK NEGERI UJUNG PANDANG",
              style: TextStyle(
                color: Colorconfig.fonttitle,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w800,
              ),
            ),
            Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colorconfig.primary],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Container(
                      height: 30,
                      child: LinearProgressIndicator(
                        value: _progressValue,
                        backgroundColor: Colors.white,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colorconfig.primary),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Center(
                  child: Text(
                    "Loading",
                    style: TextStyle(
                      color: Color(0xFF51416F),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}
