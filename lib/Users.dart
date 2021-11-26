class Users {
  final int userId;
  final String name,
      email,
      mobile,
      password,
      blood_Group,
      age,
      gender,
      smoker,
      vaccinated,
      is_Donor,
      last_Blood_Donated;

  Users(
      {this.userId,
      this.name,
      this.email,
      this.mobile,
      this.password,
      this.blood_Group,
      this.age,
      this.gender,
      this.smoker,
      this.vaccinated,
      this.is_Donor,
      this.last_Blood_Donated});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      userId: json['UserID'],
      name: json['Name'],
      email: json['Email'],
      mobile: json['Mobile'],
      password: json['Password'],
      blood_Group: json['Blood_Group'],
      age: json['Age'],
      gender: json['Gender'],
      smoker: json['Smoker'],
      vaccinated: json['Vaccinated'],
      is_Donor: json['Is_Donor'],
      last_Blood_Donated: json['Last_Blood_Donated'],
    );
  }
}
