import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:calendar_task/controllers/calendar_controller.dart';
import 'package:calendar_task/utils/color_utils.dart';
import 'package:calendar_task/utils/string_constants.dart';
import 'package:calendar_task/utils/style_manager.dart';

class CalendarScreen extends StatelessWidget {
  final CalendarController _calendarController = Get.put(CalendarController());
  CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.calendarScreen,
          style: StyleManager.headerTextStyle(),
        ),
        backgroundColor: AppColor.sunColor,
      ),
      body: GetBuilder<CalendarController>(initState: (_) {
        _calendarController.addListener(() {
          if (_calendarController.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(_calendarController.error ?? '')));
          }
        });
        _calendarController.getEventsList();
      }, builder: (controller) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                          backgroundColor: AppColor.todayColor, radius: 6),
                      Text(StringConstants.today)
                    ],
                  ),
                  const SizedBox(width: 24),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: AppColor.selectedDateColor,
                          radius: 6),
                      const Text(StringConstants.selectedDate)
                    ],
                  ),
                ],
              ),
            ),
            CalendarCarousel<Event>(
              todayButtonColor: AppColor.todayColor,
              height: 360.0,
              selectedDateTime: _calendarController.currentDate,
              headerMargin: EdgeInsets.zero,
              selectedDayButtonColor: AppColor.selectedDateColor,
              selectedDayTextStyle: StyleManager.generalTextStyle,
              weekdayTextStyle: StyleManager.greyedOutTextStyle,
              dayPadding: 4,
              weekendTextStyle: StyleManager.generalTextStyle,
              onDayPressed: (DateTime date, List<Event> events) {
                _calendarController.updateSelectedDate(date);
                if (events.isNotEmpty) {
                  _calendarController.selectedEventTitle = events[0].title!;
                  _calendarController.selectedEventDate =
                      '${events[0].date.day}/${events[0].date.month}/${events[0].date.year}';
                }
              },
              markedDateMoreCustomDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey,
              ),
              markedDatesMap: _calendarController.markedDateMap,
              customGridViewPhysics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_calendarController.selectedEventDate,
                      style: StyleManager.headerTextStyle(
                          color: AppColor.errorColor)),
                  Text(_calendarController.selectedEventTitle,
                      style: StyleManager.headerTextStyle())
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
