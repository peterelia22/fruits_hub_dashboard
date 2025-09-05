class ShippingAddressEntity {
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

  ShippingAddressEntity(
      {this.name,
      this.address,
      this.city,
      this.email,
      this.addressDetails,
      this.phoneNumber});
}
