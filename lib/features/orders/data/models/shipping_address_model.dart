class ShippingAddressModel {
  String? name;
  String? address;
  String? city;
  String? email;
  String? addressDetails;

  String? phoneNumber;
  @override
  String toString() {
    return '$address $addressDetails $city';
  }

  ShippingAddressModel(
      {this.name,
      this.address,
      this.city,
      this.email,
      this.addressDetails,
      this.phoneNumber});
  toJson() {
    return {
      'name': name,
      'phone': phoneNumber,
      'address': address,
      'floor': addressDetails,
      'city': city,
      'email': email
    };
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      phoneNumber: json['phone'],
      address: json['address'],
      addressDetails: json['floor'],
      city: json['city'],
      email: json['email'],
    );
  }
}
