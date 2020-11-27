class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String status;
  int gender;

  Student.WidthId(int id ,String firstName, String lastName, int grade,int gender) {
    this.id=id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.status = "Geçti";
    this.gender=gender;
  }
  Student.WithOutInfo(){

  }

  Student(String firstName, String lastName, int grade,int gender) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
    this.status = "Geçti";
    this.gender=gender;
  }

  String get getFirstName{
    return this.firstName;
  }
  void set setFirstName(String value) {
    this.firstName = value;
  }
  String get getStatus{
    String message;
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünleme";
    } else {
      message= "Kaldı";
    }
    return message;
  }
}
