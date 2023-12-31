import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unishop/View/bargain.dart';
import 'package:unishop/View/home.dart';
import 'package:unishop/View/recommended.dart';

class HeaderPosts extends StatelessWidget {
  const HeaderPosts({super.key, required this.currentIndex, required this.contextHeader});
  final int currentIndex;
  final BuildContext contextHeader;

  @override
  Widget build(BuildContext context) {
    Color? color1 = Colors.grey[300];

    Color? color2 = Colors.grey[300];

    Color? color3 = Colors.grey[300];

    if (currentIndex == 1) {
      color1 = Colors.orange;
    } else if (currentIndex == 2) {
      color2 = Colors.orange;
    } else if (currentIndex == 3) {
      color3 = Colors.orange;
    }
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          margin: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: SvgPicture.asset(
                  'assets/Search.svg',
                  width: 12,
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Products',
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: color1,
                ),
                onPressed: redAllProducts,
                child: Text(
                  'All Products',
                  style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: color2,
                ),
                onPressed: redRecommended,
                child: Text(
                  'Recommended',
                  style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: color3,
                ),
                onPressed: redBargain,
                child: Text(
                  'Bargains',
                  style: TextStyle(color: Colors.black), // Cambia el color del texto a negro
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void redBargain() {
    Navigator.of(contextHeader).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => BargainView(),
      ),
    );
  }

  void redRecommended(){
    Navigator.of(contextHeader).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => RecommendedView(),
            ),
          );
  }

  void redAllProducts(){
    Navigator.of(contextHeader).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => HomeView(isHome: false),
            ),
          );
  }
}