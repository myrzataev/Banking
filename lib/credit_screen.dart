import 'package:bank/calculate_credit.dart';
import 'package:bank/calculate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFAFAFA),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "КРЕДИТЫ",
            style: TextStyle(fontFamily: "SanSerif", fontSize: 24.sp),
          ),
          Text(
            "Быстрое рассмотрение заявок",
            style: TextStyle(
                fontFamily: "SanSerif", fontSize: 24.sp, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text("Оформление заявки",
                                style: TextStyle(
                                    fontFamily: "SanSerif", fontSize: 24.sp)),
                            const CustomTextField(
                              hintText: "Фамилия",
                            ),
                            const CustomTextField(
                              hintText: "Имя",
                            ),
                            const CustomTextField(
                              hintText: "Отчество",
                            ),
                            const CustomTextField(
                              hintText: "Номер",
                            ),
                            const CustomTextField(
                              hintText: "Сумма",
                            ),
                            MaterialButton(
                              color: Colors.red,
                              onPressed: () {},
                              child: Text(
                                "Отправить",
                                style: TextStyle(
                                    fontFamily: "SanSerif",
                                    fontSize: 12.sp,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Text(
                  "Оформить заявку",
                  style: TextStyle(
                      fontFamily: "SanSerif",
                      fontSize: 12.sp,
                      color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.white,
                onPressed: () {
                  // showDialog(
                  //     context: context,
                  //     builder: (context) => AlertDialog(
                  //             content: SingleChildScrollView(
                  //           child: Column(
                  //             children: [
                  //               Text("Рассчитать кредит",
                  //                   style: TextStyle(
                  //                       fontFamily: "SanSerif",
                  //                       fontSize: 24.sp)),

                  //               MaterialButton(
                  //                 color: Colors.red,
                  //                 onPressed: () {},
                  //                 child: Text(
                  //                   "Отправить",
                  //                   style: TextStyle(
                  //                       fontFamily: "SanSerif",
                  //                       fontSize: 12.sp,
                  //                       color: Colors.white),
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         )));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalculateCreditScreen1()));
                },
                child: Text(
                  "Рассчитать",
                  style: TextStyle(
                      fontFamily: "SanSerif",
                      fontSize: 12.sp,
                      color: Colors.black),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.grey))),
      ),
    );
  }
}
