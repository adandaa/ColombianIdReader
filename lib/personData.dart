class PersonData {
  String afisCode;
  String fingerCard;
  String documentNumber;
  String lastName;
  String secondLastName;
  String firstName;
  String middleName;
  String gender;
  String birthdayYear;
  String birthdayMonth;
  String birthdayDay;
  String municipalityCode;
  String departmentCode;
  String bloodType;

  PersonData({
    required this.afisCode,
    required this.fingerCard,
    required this.documentNumber,
    required this.lastName,
    required this.secondLastName,
    required this.firstName,
    required this.middleName,
    required this.gender,
    required this.birthdayYear,
    required this.birthdayMonth,
    required this.birthdayDay,
    required this.municipalityCode,
    required this.departmentCode,
    required this.bloodType,
  });

  @override
  String toString() {
    return 'PersonData{afisCode: $afisCode, fingerCard: $fingerCard, documentNumber: $documentNumber, lastName: $lastName, secondLastName: $secondLastName, firstName: $firstName, middleName: $middleName, gender: $gender, birthdayYear: $birthdayYear, birthdayMonth: $birthdayMonth, birthdayDay: $birthdayDay, municipalityCode: $municipalityCode, departmentCode: $departmentCode, bloodType: $bloodType}';
  }
}
