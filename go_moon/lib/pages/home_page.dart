import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _astroImageWidget(),
            Center(
              child: _pageTitle(),
            ),
          ],
        ),
      ),
    );
  }
  Widget _pageTitle(){
    return const Text(
      '#GoMoon',
      style: TextStyle(
        fontSize: 70,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    );
  }
  Widget _astroImageWidget() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/astro_moon.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}