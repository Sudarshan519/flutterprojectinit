class GatheringModel {
  String? date;
  String? time;
  String? location;
  String? type;
  String? username;
  String? userid;

  GatheringModel({this.date, this.time, this.location, this.type});

  GatheringModel.fromJson(Map<String, dynamic> json) {
    date = json['id'];
    time = json['name'];
    location = json['location'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['location'] = location;
    data['type'] = type;
    return data;
  }
}

enum GATHERING_TYPE {
  WAITING_GROUPS,
  ONLINE_GROUPS,
  CAFE_GROUPS,
  MEETING_GROUPS
}
