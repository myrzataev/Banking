import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:bank/credit_screen.dart';
import 'package:bank/main_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller =
      NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      Page1(
        controller: (_controller),
      ),
      const Page2(),
      const Page3()
    ];
    return Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= 3)
            ? AnimatedNotchBottomBar(
                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                color: Colors.white,
                showLabel: true,
                textOverflow: TextOverflow.visible,
                maxLine: 1,
                shadowElevation: 20,
                kBottomRadius: 28.0,
                notchColor: Color(0xff32D74B).withOpacity(0.3),
                removeMargins: false,
                bottomBarWidth: 500,
                showShadow: false,
                durationInMilliSeconds: 300,
                blurOpacity: 1,
                
                itemLabelStyle: const TextStyle(fontSize: 10),

                elevation: 1,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.home_filled,
                      color: Colors.blueGrey,
                    ),
                    activeItem: Icon(
                      Icons.home_filled,
                      color: Colors.lightGreen,
                    ),
                    itemLabel: 'Главная',
                  ),
                  BottomBarItem(
                    inActiveItem:
                        Icon(Icons.credit_score, color: Colors.blueGrey),
                    activeItem: Icon(
                      Icons.credit_score,
                      color: Colors.lightGreen,
                    ),
                    itemLabel: 'Кредит',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.more, color: Colors.blueGrey),
                    activeItem: Icon(
                      Icons.more,
                      color: Colors.lightGreen,
                    ),
                    itemLabel: 'Еще',
                  ),
                ],
                onTap: (int value) {
                  print(value);
                  _pageController.jumpToPage(value);
                },
                kIconSize: 30,
              )
            : null);
  }
}



class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xffFAFAFA),
        child: const Center(child: Text('Еще')));
  }
}
