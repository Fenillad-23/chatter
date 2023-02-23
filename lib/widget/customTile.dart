import 'package:flutter/material.dart';

import 'TextView.dart';

ScrollController _controller = new ScrollController();
ListView DoctorListView(List doctorData, Widget elevatedButton, int itemCount) {
  return ListView.builder(
    itemCount: itemCount,
    controller: _controller,
    shrinkWrap: true,
    // scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 20, right: 20),
        child: GestureDetector(
          onTap: () {
            // Get.to(DoctorInfo(),
            //     transition: Transition.fade,
            //     curve: Curves.easeInCirc,
            //     duration: Duration(milliseconds: 2000),
            //     arguments: [doctorData[index]]);
          },
          child: SizedBox(
            height: 98,
            width: 370,
            child: Container(
              height: 98,
              width: 370,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: CircleAvatar(
                            radius: 25,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(doctorData[index]['img'])),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 170,
                    // color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          doctorData[index]['name'],
                          fontSize: 18,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: TextView(
                            doctorData[index]['category'],
                            // textColor: AppColors.shadowColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_history_outlined,
                                size: 15,
                                // color: AppColors.darkTextColor,
                              ),
                              TextView(
                                doctorData[index]['distance'],
                                // textColor: AppColors.shadowColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      // color: Colors.blue,
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow.shade700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextView(
                              doctorData[index]['rating'],
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(
                          children: [
                            elevatedButton,
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
