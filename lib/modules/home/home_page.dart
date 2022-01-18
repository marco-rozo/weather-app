import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:weather_app/modules/bottom_modal/bottom_modal.dart';
import 'package:weather_app/modules/home/home_controller.dart';
import 'package:weather_app/modules/home/widgets/card_weather_today.dart';
import 'package:weather_app/modules/home/widgets/card_weather_weekly.dart';

Future<void> showBottomResult(context) async {
  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    isScrollControlled: true,
    barrierColor: Colors.white.withOpacity(0.01),
    builder: (BuildContext context) {
      return BottomModal();
    },
  );
}

class HomePage extends GetView<HomeController> {
  @override
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
            child: IconButton(
              onPressed: () => showBottomResult(context),
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return controller.weatherCurrent.value != null
                  ? CardWeathertToday(
                      weatherCurrent: controller.weatherCurrent.value)
                  : Container();
            }),
            // Padding(
            //   padding: EdgeInsets.only(top: 20.0, left: 22, right: 22),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Text(
            //         'More cities',
            //         style: TextStyle(
            //           fontSize: 22,
            //           color: Colors.white,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           'See more',
            //           style: TextStyle(fontWeight: FontWeight.w400),
            //         ),
            //         style: TextButton.styleFrom(
            //           padding: const EdgeInsets.all(16.0),
            //           primary: Colors.white,
            //           textStyle: const TextStyle(
            //             fontSize: 14,
            //             decoration: TextDecoration.underline,
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Container(
            //     margin: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            //     child: Row(
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(right: 20.0),
            //           child: Container(
            //             padding: EdgeInsets.all(8),
            //             height: Get.width * .30,
            //             width: Get.width * .30,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20.0),
            //               color: Color(0xff6B83CD),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade900,
            //                   offset: Offset(2, 2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //                 BoxShadow(
            //                   color: Colors.white,
            //                   offset: Offset(-2, -2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //               ],
            //             ),
            //             child: Center(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     '16°',
            //                     style: TextStyle(
            //                       fontSize: 34,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Guaruja do sul',
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 20.0),
            //           child: Container(
            //             padding: EdgeInsets.all(8),
            //             height: Get.width * .30,
            //             width: Get.width * .30,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20.0),
            //               color: Color(0xff6B83CD),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade900,
            //                   offset: Offset(2, 2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //                 BoxShadow(
            //                   color: Colors.white,
            //                   offset: Offset(-2, -2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //               ],
            //             ),
            //             child: Center(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     '16°',
            //                     style: TextStyle(
            //                       fontSize: 34,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Guaruja do sul',
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 20.0),
            //           child: Container(
            //             padding: EdgeInsets.all(8),
            //             height: Get.width * .30,
            //             width: Get.width * .30,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20.0),
            //               color: Color(0xff6B83CD),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade900,
            //                   offset: Offset(2, 2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //                 BoxShadow(
            //                   color: Colors.white,
            //                   offset: Offset(-2, -2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //               ],
            //             ),
            //             child: Center(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     '16°',
            //                     style: TextStyle(
            //                       fontSize: 34,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Guaruja do sul',
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(right: 20.0),
            //           child: Container(
            //             padding: EdgeInsets.all(8),
            //             height: Get.width * .30,
            //             width: Get.width * .30,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(20.0),
            //               color: Color(0xff6B83CD),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade900,
            //                   offset: Offset(2, 2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //                 BoxShadow(
            //                   color: Colors.white,
            //                   offset: Offset(-2, -2),
            //                   blurRadius: 6,
            //                   spreadRadius: 1,
            //                 ),
            //               ],
            //             ),
            //             child: Center(
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.center,
            //                 children: [
            //                   Text(
            //                     '16°',
            //                     style: TextStyle(
            //                       fontSize: 34,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                   Text(
            //                     'Guaruja do sul',
            //                     maxLines: 2,
            //                     overflow: TextOverflow.ellipsis,
            //                     textAlign: TextAlign.center,
            //                     style: TextStyle(
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 22, right: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Week forecast',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 12),
                child: Obx(() {
                  return Row(
                    children: controller.weatherWeekly
                        .map((w) => CardWeatherWeekly(
                              weatherWeekly: w,
                            ))
                        .toList(),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
