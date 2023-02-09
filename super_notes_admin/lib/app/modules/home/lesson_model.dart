class Lesson {
  String? id;
  String? subjectId;
  String? title;
  String? desc;
  int? noteCount;
  String? createDate;
  String? updateDate;
  bool? verified;

  Lesson(
      {this.id,
      this.subjectId,
      this.title,
      this.desc,
      this.noteCount,
      this.createDate,
      this.updateDate,
      this.verified});

  Lesson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subjectId'];
    title = json['title'];
    desc = json['desc'];
    noteCount = json['noteCount'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    verified = json['verified'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['subjectId'] = subjectId;
    data['title'] = title;
    data['desc'] = desc;
    data['noteCount'] = noteCount;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['verified'] = verified;
    return data;
  }
}
