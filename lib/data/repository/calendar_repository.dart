import 'dart:convert';

import 'package:calendar_task/data/config/url_constants.dart';
import 'package:calendar_task/domain/model/event_model.dart';
import 'package:calendar_task/data/network/network_util.dart';
import 'package:calendar_task/domain/repository/calendar_repository.dart';
import 'package:http/http.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl(this.networkUtil);
  final NetworkUtil networkUtil;

  @override
  Future<List<EventModel>> getEvents() async {
    try {
      Response response = await networkUtil.get(UrlConstants.getEvents);
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        return data.map((e) => EventModel.fromJson(e)).toList();
      } else {
        throw Exception('API call not successful : ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
