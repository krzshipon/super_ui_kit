class CsAddress {
  String? name;
  String? mobile;
  String? division;
  String? city;
  String? area;
  String? addressLine;
  String? label;
  bool? isDefault;

  CsAddress(
      {this.name,
      this.mobile,
      this.addressLine,
      this.city,
      this.area,
      this.division,
      this.label,
      this.isDefault});

  CsAddress.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobile = json['mobile'];
    division = json['division'];
    city = json['city'];
    area = json['area'];
    area = json['area'];
    addressLine = json['addressLine'];
    label = json['label'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['mobile'] = mobile;
    data['division'] = division;
    data['city'] = city;
    data['area'] = area;
    data['addressLine'] = addressLine;
    data['label'] = label;
    data['isDefault'] = isDefault;
    return data;
  }
}
