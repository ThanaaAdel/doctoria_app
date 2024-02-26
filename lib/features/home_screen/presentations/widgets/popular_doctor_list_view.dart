import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/theming/styles.dart';
import 'not_found_widget.dart';
class PopularDoctorListView extends StatelessWidget {
  const PopularDoctorListView(
      {super.key,
        required this.items,
        required this.name,
        required this.imageLink});
  final int items;
  final String name;
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return items > 0
        ? ListView.builder(
      itemCount: items,
      itemBuilder: (context, index) => Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
        child: Row(children: [
          Image.network(imageLink, height: 100.h, width: 100.w),
          horizontalSpacing(20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: TextStyles.font18Black500),
                  horizontalSpacing(20),
                  Icon(Icons.favorite_border,
                      color: ColorsManager.mainBlue, size: 20.sp),
                ],
              ),
              verticalSpacing(5),
              Text("Dentist in Elgabry hospital",
                  style: TextStyles.font14Black500.copyWith(
                      color: ColorsManager.mainBlack.withOpacity(0.5))),
              verticalSpacing(5),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15.sp,
                        color: ColorsManager.mainBlue,
                      ),
                      verticalSpacing(2),
                      Text("4.8"),
                    ],
                  ),
                  horizontalSpacing(15),
                  Text("(4250 reviews)",
                      style: TextStyles.font14Black500.copyWith(
                          color:
                          ColorsManager.mainBlack.withOpacity(0.5))),
                ],
              )
            ],
          )
        ]),
      ),
    )
        : const NotFoundWidget();
  }
}

