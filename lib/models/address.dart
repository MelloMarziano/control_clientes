class Address {
  int addressId;
  int customerId;
  String address;

  Address(
      {required this.addressId,
      required this.customerId,
      required this.address});

  Map<String, dynamic> toMap() {
    return {
      'addressId': addressId,
      'customerId': customerId,
      'address': address,
    };
  }
}
