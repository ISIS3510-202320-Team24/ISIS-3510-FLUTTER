import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unishop/View/favorite.dart';
import 'package:unishop/View/home.dart';
import 'package:unishop/View/profile.dart';

class Footer extends StatelessWidget {
  const Footer({super.key, required this.currentIndex, required this.contextFooter});
  final int currentIndex;
  final BuildContext contextFooter;

  @override
  Widget build(context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType
          .fixed, // To display all items, even if there are more than 3.
      selectedItemColor: Colors.orange, // Color for the selected item.
      unselectedItemColor: Colors.grey,
      selectedLabelStyle:
          TextStyle(color: Colors.orange), // Color for unselected items.
      onTap: (index) {
        //Perform navigation based on the tapped item.
        switch (index) {
          case 0:
            //Navigate to the Home page.
            Navigator.of(contextFooter).pushReplacement(MaterialPageRoute(
                builder: (ctx) => HomeView(isHome: true)));
            break;
          case 1:
            //Navigate to the Posts page.
             Navigator.of(contextFooter).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomeView(isHome: false)));
            break;
          case 2:
            break;
          case 3:
            //Navigate to the Favorite page.
            Navigator.of(contextFooter).pushReplacement(
                MaterialPageRoute(builder: (ctx) => FavoriteView()));
          case 4:
            //Navigate to the profile page.
            Navigator.of(contextFooter).pushReplacement(
                MaterialPageRoute(builder: (ctx) => Profile()));
          // break;
        }
      },
      items: [
        //Define the items in the footer.
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Home.svg', width: 30, height: 30),
          label: 'Home',
          activeIcon: SvgPicture.asset('assets/Home.svg',
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
              width: 30,
              height: 30),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Posts.svg', width: 30, height: 30),
          label: 'Posts',
          activeIcon: SvgPicture.asset('assets/Posts.svg',
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
              width: 30,
              height: 30),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map_outlined,
            color: Color.fromRGBO(0, 0, 0, 0),
          ),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Favorite.svg', width: 30, height: 30),
          label: 'Favorites',
          activeIcon: SvgPicture.asset('assets/Favorite.svg',
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
              width: 30,
              height: 30),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/Profile.svg', width: 30, height: 30),
          label: 'Profile',
          activeIcon: SvgPicture.asset('assets/Profile.svg',
              colorFilter: ColorFilter.mode(Colors.orange, BlendMode.srcIn),
              width: 30,
              height: 30),
        ),
      ],
    );
  }
}
