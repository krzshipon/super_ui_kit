class Note {
  String? id;
  String? subjectId;
  String? lessonId;
  String? title;
  String? desc;
  String? author;
  String? creditSrc;
  String? coverAnimSrc;
  String? src;
  List<String>? previewSrcList;
  int? likeCount;
  dynamic createDate;
  dynamic updateDate;
  bool? verified;
  bool? isFav;

  Note(
      {this.id,
      this.subjectId,
      this.lessonId,
      this.title,
      this.desc,
      this.author,
      this.creditSrc,
      this.coverAnimSrc,
      this.src,
      this.previewSrcList,
      this.likeCount,
      this.createDate,
      this.updateDate,
      this.verified,
      this.isFav});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subjectId'];
    lessonId = json['lessonId'];
    title = json['title'];
    desc = json['desc'];
    author = json['author'];
    creditSrc = json['creditSrc'];
    coverAnimSrc = json['coverAnimSrc'];
    src = json['src'];
    previewSrcList = json['previewSrcList'].cast<String>();
    likeCount = json['likeCount'];
    createDate = json['createDate'];
    updateDate = json['updateDate'];
    verified = json['verified'];
    isFav = json['isFav'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['subjectId'] = subjectId;
    data['lessonId'] = lessonId;
    data['title'] = title;
    data['desc'] = desc;
    data['author'] = author;
    data['creditSrc'] = creditSrc;
    data['coverAnimSrc'] = coverAnimSrc;
    data['src'] = src;
    data['previewSrcList'] = previewSrcList;
    data['likeCount'] = likeCount;
    data['createDate'] = createDate;
    data['updateDate'] = updateDate;
    data['verified'] = verified;
    data['isFav'] = isFav;
    return data;
  }
}
