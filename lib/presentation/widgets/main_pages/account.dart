import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => Container(
        child: Stack(
          children: [
            Positioned.fill(child: Sticker()),
            Align(
                alignment: Alignment.center,
                child: Text("csasfsdsfedgrgrgrcsasfsdsfedgrgrgr"))
          ],
        ),
      ),
      itemCount: 14,
    );
  }
}

class Sticker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset("assets/svg/corona1.svg"),
    );
  }
}
