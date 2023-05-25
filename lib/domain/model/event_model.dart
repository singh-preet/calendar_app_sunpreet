class EventModel {
  late String id;
  late DateTime date;
  late String title;
  late String venue;

  EventModel(
      {required this.id,
      required this.date,
      required this.title,
      required this.venue});

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = getDateTime(DateTime.parse(json['date']));
    venue = json['venue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['date'] = date;
    data['venue'] = venue;
    return data;
  }

  getDateTime(DateTime dt) => DateTime(dt.year, dt.month, dt.day);
}
