class User {
  String? number,
      id,
      name,
      mobile,
      email,
      gender,
      dob,
      address,
      type,
      paidOrFree;

  User(
      {this.number,
      this.id,
      this.name,
      this.mobile,
      this.email,
      this.gender,
      this.dob,
      this.address,
      this.type,
      this.paidOrFree});

  factory User.fromJson(Map<String, dynamic> json) => User(
      number: json['userNo'],
      id: json['userId'],
      name: json['name'],
      mobile: json['mobileNo'],
      email: json['emailId'],
      gender: json['gender'],
      dob: json['dob'],
      address: json['address'],
      type: json['userType'],
      paidOrFree: json['paidOrFree']);
}
