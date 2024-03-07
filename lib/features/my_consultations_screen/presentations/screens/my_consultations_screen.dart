import 'package:doctoria_app/core/theming/image_manager.dart';
import 'package:doctoria_app/features/my_consultations_screen/presentations/widgets/booking_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/dependacy_injection.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home_patient_screen/presentations/widgets/not_found_widget.dart';
import '../../data/models/booking_model/booking_model.dart';
import '../../logic/booking_accept_cubit/booking_accept_cubit.dart';
import '../../logic/booking_cubit/booking_cubit.dart';
import '../../logic/booking_cubit/booking_states.dart';

class MyConsultationsScreen extends StatefulWidget {
  const MyConsultationsScreen({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<MyConsultationsScreen> createState() => _MyConsultationsScreenState();
}

class _MyConsultationsScreenState extends State<MyConsultationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late String currentStatus; // Add a variable to track the current status

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    currentStatus = "pending"; // Set the initial status
    fetchData(); // Fetch data initially

    tabController.addListener(() {
      // Fetch data whenever the tab changes
      if (tabController.indexIsChanging) {
        switch (tabController.index) {
          case 0:
            currentStatus = "pending";
            break;
          case 1:
            currentStatus = "active";
            break;
          case 2:
            currentStatus = "complete";
            break;
        }
        fetchData();
      }
    });

    super.initState();
  }

  void fetchData() {
    // Fetch data based on the current status
    context.read<BookingCubit>().emitBookingData(
          status: currentStatus,
          token:
              "Bearer ${widget.token}",
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: consultationAppBar(context),
      body: BlocBuilder<BookingCubit, BookingStates>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const Center(
                  child:
                      CircularProgressIndicator(color: ColorsManager.mainBlue));
            },
            loading: () {
              return const Center(
                  child:
                      CircularProgressIndicator(color: ColorsManager.mainBlue));
            },
            success: (data) {
              final BookingModel bookingModel = data;
              return successState(bookingModel);
            },
            error: (error) {
              return Center(child: Text(error));
            },
          );
        },
      ),
    );
  }

  AppBar consultationAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.mainWhite,
      title: Text(S.of(context).my_consultations),
      titleTextStyle: TextStyles.font18Black500,
      automaticallyImplyLeading: true,
      foregroundColor: ColorsManager.mainBlack,
      bottom: TabBar(
        unselectedLabelStyle: TextStyles.font14Black500,
        unselectedLabelColor: ColorsManager.mainBlack,
        labelColor: ColorsManager.mainBlue,
        labelStyle: TextStyles.font14Blue500,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.only(left: 20.w, right: 20.w),
        indicatorWeight: 3.w,
        labelPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
        tabs: [
          Text(S.of(context).all_consulting),
          Text(S.of(context).active),
          Text(S.of(context).complete),
        ],
        controller: tabController,
      ),
    );
  }

  Widget successState(BookingModel bookingModel) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                // Tab 0 - All Consulting
                if (bookingModel.bookingData != null &&
                    bookingModel.bookingData!.isNotEmpty)
                  tabsListView(bookingModel, status: "pending")
                else
                   NotFoundWidget(
                    imageLink: ImageManager.onboardingScreen3Image,
                     text: S.of(context).consultation_text,
                     textDesc: S.of(context).consultation_text_desc,
                  ),

                // Tab 1 - Active
                if (bookingModel.bookingData != null &&
                    bookingModel.bookingData!.isNotEmpty)
                  tabsListView(bookingModel, status: "active")
                else
                  NotFoundWidget(
                    imageLink: ImageManager.onboardingScreen3Image,
                    text: S.of(context).consultation_text,
                    textDesc: S.of(context).consultation_text_desc,
                  ),

                // Tab 2 - Complete
                if (bookingModel.bookingData != null &&
                    bookingModel.bookingData!.isNotEmpty)
                  tabsListView(bookingModel, status: "complete")
                else
                  NotFoundWidget(
                    imageLink: ImageManager.onboardingScreen3Image,
                    text: S.of(context).consultation_text,
                    textDesc: S.of(context).consultation_text_desc,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView tabsListView(BookingModel bookingModel, {String? status}) {
    return ListView.builder(
      itemCount: bookingModel.bookingData!.length,
      itemBuilder: (context, index) {
        final bookingPatientData = bookingModel.bookingData![index];

        // Filter items based on the selected tab's status
        if (status == null || bookingPatientData.status == status) {
          return BlocProvider(
            create: (context) => getIt<BookingAcceptCubit>(),
            child: BookingListViewWidget(
              token:"Bearer ${widget.token}",
              bookingId: bookingPatientData.id!.toInt(),
              time:  bookingPatientData.time.toString(),
              // time: calculateTimeDifference(bookingPatientData.time.toString()),
              name: bookingPatientData.patient!.name.toString(),
              description: bookingPatientData.desc.toString(),
              status: bookingPatientData.status.toString(),
              imageLink: bookingPatientData.patient!.image.toString(),
            ),
          );
        } else {
          return const SizedBox(); // Return an empty container if the item doesn't match the selected tab's status
        }
      },
    );
  }
  String calculateTimeDifference(String? bookingTime) {
    if (bookingTime == null) {
      return ''; // Handle null or invalid input
    }

    // Assuming bookingTime format is 'HH:mm:ss'
    List<String> timeComponents = bookingTime.split(':');

    DateTime bookingDateTime = DateTime.now().subtract(Duration(
      hours: int.parse(timeComponents[0]),
      minutes: int.parse(timeComponents[1]),
      seconds: int.parse(timeComponents[2]),
    ));

    DateTime now = DateTime.now();
    Duration difference = now.difference(bookingDateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min ago'; // Display as "X min ago"
    } else {
      return 'Just now';
    }
  }


}
