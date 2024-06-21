// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:u_credit_card/u_credit_card.dart';

class Page1 extends StatefulWidget {
  final NotchBottomBarController? controller;

  const Page1({Key? key, this.controller}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  List<Color> colorsList = [Colors.purple, Colors.yellow, Colors.green];
  final PageController _controller = PageController(viewportFraction: 0.8);
  final List<bool> _selectedFruits = <bool>[
    false,
    false,
  ];
  List<Widget> fruits = const <Widget>[
    Text('Наличный'),
    Text('Безналичный'),
  ];
  bool _isChanged = true;
  @override
  Widget build(BuildContext context) {
    List<CardModel> cardList = CardModelData.cardListData;

    return Container(
      color: const Color(0xffFAFAFA),
      child: Center(
        /// adding GestureDetector
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            widget.controller?.jumpTo(2);
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Илим",
                    style: TextStyle(fontFamily: "SanSerif", fontSize: 24.sp),
                  ),
                  SizedBox(
                    height: 210.h,
                    child: PageView.builder(
                        itemCount: 3,
                        controller: _controller,
                        itemBuilder: (context, index) {
                          double factor = 1;
                          if (_controller.position.hasContentDimensions) {
                            factor = 1 - (_controller.page! - index).abs();
                          }
                          return SizedBox(
                            height: 170.h + (factor * 20.h),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.h),
                              child: CreditCardUi(
                                  topLeftColor: colorsList[index],
                                  cardHolderFullName: "Ilim Irgashev",
                                  cardNumber: "4343 4243 4656 5672",
                                  validThru: "10/24"),
                            ),
                          );
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Баланс:',
                        style: TextStyle(
                            fontFamily: "SanSerif",
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp),
                      ),
                      Text(
                        "6690 c",
                        style: TextStyle(
                            fontFamily: "SanSerif",
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 300.h,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomCard(
                              title: cardList[index].title,
                              text: cardList[index].text,
                              image: cardList[index].image,
                            ),
                          );
                        },
                        itemCount: cardList.length,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Container(
                      height: 300.h,
                      width: double.infinity,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Курсы валют:',
                              style: TextStyle(
                                  fontFamily: "SanSerif",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.sp),
                            ),
                            ToggleButtons(
                              direction: Axis.horizontal,
                              onPressed: (int index) {
                                setState(() {
                                  // The button that is tapped is set to true, and the others to false.
                                  for (int i = 0;
                                      i < _selectedFruits.length;
                                      i++) {
                                    _selectedFruits[i] = i == index;
                                  }
                                  if (index == 0) {
                                    _isChanged = false;
                                  } else {
                                    _isChanged = true;
                                  }
                                });
                              },
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              selectedColor: Colors.white,
                              fillColor: Colors.black87,
                              color: Colors.red[400],
                              constraints: const BoxConstraints(
                                minHeight: 40.0,
                                minWidth: 80.0,
                              ),
                              isSelected: _selectedFruits,
                              children: fruits,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Валюта",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  "Покупка",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  "Продажа",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "SanSerif"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "USD",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "86.1000" : "84.1000",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "86.9500" : "88.782",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "EUR",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "92.4000" : "90.4000",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "93.4000" : "90-.4000",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "RUB",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "0.9300" : "0.900",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "1.0400" : "1.200",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "KZT",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "0.1324" : "0.224",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                ),
                                Text(
                                  _isChanged ? "0.2100" : "0.200",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontFamily: "SanSerif"),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardModel {
  final String image;
  final String text;
  final String title;
  CardModel({required this.image, required this.text, required this.title});
}

abstract class CardModelData {
  static List<CardModel> cardListData = [
    CardModel(
        image: "assets/images/JEMA GER 1722-14.jpg",
        text: "Выдача от 15 минут онлайн",
        title: "Кредиты"),
    CardModel(
        image: "assets/images/Wavy_Tech-31_Single-01.jpg",
        text: "Большой выбор товаров без переплат - 0%",
        title: "Рассрочка"),
    CardModel(
        image:
            "assets/images/decorative-houseplant-isolated-white-background.jpg",
        text: "Удобное снятие и пополнение",
        title: "Депозиты"),
    CardModel(
        image:
            "assets/images/Bill or receipt and credit card 3D illustration.jpg",
        text: "Безопасное хранение ваших ценностей",
        title: "Cейфовые ячейки"),
  ];
}

class CustomCard extends StatelessWidget {
  final String title;
  final String text;
  final String image;

  const CustomCard({
    super.key,
    required this.title,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 300.w,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black87,
              blurRadius: 2,
              spreadRadius: 0.1,
            ),
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              // "assets/images/Bill or receipt and credit card 3D illustration.jpg",
              height: 100.h,
              fit: BoxFit.fill,
            ),
            Text(
              title,
              // "Cейфовые ячейки",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
            ),
            Text(
              text,
              // "Безопасное хранение ваших ценностей",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 15.sp),
            ),
            const Spacer(),
            Text(
              "Узнать больше",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}

// class ServiceModel{
//   final Str
// }