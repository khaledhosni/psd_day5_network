import 'dart:convert';

/// createdAt : "2022-03-24T18:50:53.910Z"
/// name : "Melissa Russel"
/// avatar : "http://placeimg.com/640/480/cats"
/// phone : "(604) 523-5076 x776"
/// country : "Bedfordshire"
/// photo : "photo 1"
/// birthdate : "2021-06-27T20:35:40.305Z"
/// id : "1"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? createdAt, 
      String? name, 
      String? avatar, 
      String? phone, 
      String? country, 
      String? photo, 
      String? birthdate, 
      String? id,}){
    _createdAt = createdAt;
    _name = name;
    _avatar = avatar;
    _phone = phone;
    _country = country;
    _photo = photo;
    _birthdate = birthdate;
    _id = id;
}

  User.fromJson(dynamic json) {
    _createdAt = json['createdAt'];
    _name = json['name'];
    _avatar = json['avatar'];
    _phone = json['phone'];
    _country = json['country'];
    _photo = json['photo'];
    _birthdate = json['birthdate'];
    _id = json['id'];
  }
  String? _createdAt;
  String? _name;
  String? _avatar;
  String? _phone;
  String? _country;
  String? _photo;
  String? _birthdate;
  String? _id;
User copyWith({  String? createdAt,
  String? name,
  String? avatar,
  String? phone,
  String? country,
  String? photo,
  String? birthdate,
  String? id,
}) => User(  createdAt: createdAt ?? _createdAt,
  name: name ?? _name,
  avatar: avatar ?? _avatar,
  phone: phone ?? _phone,
  country: country ?? _country,
  photo: photo ?? _photo,
  birthdate: birthdate ?? _birthdate,
  id: id ?? _id,
);
  String? get createdAt => _createdAt;
  String? get name => _name;
  String? get avatar => _avatar;
  String? get phone => _phone;
  String? get country => _country;
  String? get photo => _photo;
  String? get birthdate => _birthdate;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAt'] = _createdAt;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['phone'] = _phone;
    map['country'] = _country;
    map['photo'] = _photo;
    map['birthdate'] = _birthdate;
    map['id'] = _id;
    return map;
  }

}