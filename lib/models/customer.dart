class Customer {
  int customerId;
  String name;
  String phone;
  Customer({
    required this.customerId,
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'customerId': customerId,
      'name': name,
      'phone': phone,
    };
  }
}
