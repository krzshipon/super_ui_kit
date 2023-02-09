class Subject {
  String? id;
  String? title;
  int? noteCount;
  int? lessonCount;
  dynamic createDate;
  dynamic updateDate;
  bool? verified;
  String? sectionId;

  Subject(
      {this.id,
      this.title,
      this.noteCount,
      this.lessonCount,
      this.createDate,
      this.updateDate,
      this.verified,
      this.sectionId});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    noteCount = json['noteCount'];
    lessonCount = json['lessonCount'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    verified = json['verified'];
    sectionId = json['sectionId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['noteCount'] = noteCount;
    data['lessonCount'] = lessonCount;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['verified'] = verified;
    data['sectionId'] = sectionId;
    return data;
  }
}
