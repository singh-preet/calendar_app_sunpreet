import 'package:calendar_task/domain/model/event_model.dart';

abstract class CalendarRepository{

  Future<List<EventModel>> getEvents();

}