import 'package:calendar_task/di/Bindings.dart';
import 'package:calendar_task/domain/repository/calendar_repository.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:calendar_task/domain/model/event_model.dart';
import 'package:calendar_task/utils/string_constants.dart';

class CalendarController extends GetxController {
  String? error;
  DateTime currentDate = DateTime.now();
  EventList<Event> markedDateMap = EventList<Event>(events: {});
  String selectedEventTitle = StringConstants.empty;
  String selectedEventDate = StringConstants.empty;
  CalendarRepository calendarRepository = getIt<CalendarRepository>();


  updateSelectedDate(DateTime date) {
    currentDate = date;
    update();
  }

  getEventsList() async {
    try {
      List<EventModel> data = await calendarRepository.getEvents();
      for (var element in data) {
        markedDateMap.add(
            element.date, Event(date: element.date, title: element.title));
      }
      error = null;
      update();
    } catch (e) {
      error = e.toString();
    }
  }
}
