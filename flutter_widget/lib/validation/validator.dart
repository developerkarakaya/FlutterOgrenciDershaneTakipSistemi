class StudentValidationMixin {
String ValidateFirstName(String value) {
    if(value.length<=2) {
      return "İsim en az 3 karekter olmalıdır. ";
    }
}

String ValidateLastName(String value) {
  if(value.length<=2) {
    return "Soyisim en az 3 karekter olmalıdır. ";
  }
}

String ValidateGrade(String value) {
  var grade = int.parse(value);

  if(grade<0 || grade>100) {
    return "Girilen Not 0-100 arasında olmalıdır.";
  }
}
}

