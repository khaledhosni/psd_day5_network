import 'dart:convert';

/// name : "name 1"
/// type : "type 1"
/// src : "src 1"
/// id : "1"

ImageUpload imageFromJson(String str) => ImageUpload.fromJson(json.decode(str));
String imageToJson(ImageUpload data) => json.encode(data.toJson());
class ImageUpload {
  ImageUpload({
      String? name, 
      String? type, 
      String? src, 
      String? id,}){
    _name = name;
    _type = type;
    _src = src;
    _id = id;
}

  ImageUpload.fromJson(dynamic json) {
    _name = json['name'];
    _type = json['type'];
    _src = json['src'];
    _id = json['id'];
  }
  String? _name;
  String? _type;
  String? _src;
  String? _id;
ImageUpload copyWith({  String? name,
  String? type,
  String? src,
  String? id,
}) => ImageUpload(  name: name ?? _name,
  type: type ?? _type,
  src: src ?? _src,
  id: id ?? _id,
);
  String? get name => _name;
  String? get type => _type;
  String? get src => _src;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['type'] = _type;
    map['src'] = _src;
    map['id'] = _id;
    return map;
  }

}