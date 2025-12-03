import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;
  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [_pageTitle(), _destinationDropDownWidget()],
          ),
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
      child: Text(
        '#GoMoon',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(offset: Offset(2, 2), blurRadius: 3, color: Colors.black54),
          ],
        ),
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

  Widget _destinationDropDownWidget() {
    List<String> _items = ['Moon', 'Mars'];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),

      child: DropdownButton(
        value: _items.first,
        onChanged: (_) {},
        items: _items
            .map((e) => DropdownMenuItem(child: Text(e), value: e))
            .toList(),
        underline: Container(),
        dropdownColor: const Color.fromRGBO(53, 53, 53, 1.0),
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
