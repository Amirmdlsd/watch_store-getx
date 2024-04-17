class UserModel {
  final int? id;
  final String? name;
  final String? mobile;
  final String? phone;
  final String ?address;
  final double? lat;
  final double ?lng;
  final String ?postalCode;

  UserModel({
     this.id,
     this.name,
     this.mobile,
     this.phone,
     this.address,
     this.lat,
     this.lng,
     this.postalCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      phone: json['phone'],
      address: json['address']['address'],
      lat: json['address']['lat'],
      lng: json['address']['lng'],
      postalCode: json['address']['postal_code'],
    );
  }
}
