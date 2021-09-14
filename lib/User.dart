class User {
  String _Fullname,
      _Email,
      _Mobile,
      _Password,
      _BloodGroup,
      _Age,
      _Gender,
      _Smoker,
      _Vaccinated,
      _LastBloodDonationDate;

  String get Fullname => _Fullname;

  set Fullname(String value) {
    _Fullname = value;
  }

  get LastBloodDonationDate => _LastBloodDonationDate;

  set LastBloodDonationDate(value) {
    _LastBloodDonationDate = value;
  }

  set Password(value) {
    _Password = value;
  }

  get Password => _Password;

  get Email => _Email;

  get Vaccinated => _Vaccinated;

  set Vaccinated(value) {
    _Vaccinated = value;
  }

  get Smoker => _Smoker;

  set Smoker(value) {
    _Smoker = value;
  }

  get Gender => _Gender;

  set Gender(value) {
    _Gender = value;
  }

  get Age => _Age;

  set Age(value) {
    _Age = value;
  }

  get BloodGroup => _BloodGroup;

  set BloodGroup(value) {
    _BloodGroup = value;
  }

  get Mobile => _Mobile;

  set Mobile(value) {
    _Mobile = value;
  }

  set Email(value) {
    _Email = value;
  }
}
