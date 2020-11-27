import 'package:flutter/material.dart';
import 'package:flutter_widget/models/student.dart';
import 'package:flutter_widget/validation/validator.dart';

import '../main.dart';

class StudentAdd extends StatefulWidget {
List<Student> students;
StudentAdd(List<Student> students) {
    this.students=students;
}
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> students;
  _StudentAddState(List<Student> students) {
    this.students=students;
  }
  var formKey = GlobalKey<FormState>();
  var student = Student.WithOutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Ekleme Sayfası"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [buildFirstName(), buildLastName(), buildGrade(),buildGender(),buildSaveButton() ],
          ),
        ),
      ),
    );
  }

 Widget buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Adı"),
      validator: ValidateFirstName,
      onSaved: (String value) {
        student.firstName = value;
      },
    );
  }

  Widget buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı"),
      validator: ValidateLastName,
      onSaved: (String value) {
        student.lastName = value;
      },
    );
  }

  Widget buildGrade() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Notu"),
      validator: ValidateGrade,
      onSaved: (String value) {
        student.grade = int.parse(value);
      },
    );
  }

  Widget buildSaveButton() {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: (){
    if(formKey.currentState.validate()) {
      formKey.currentState.save();
      students.add(student);
      Navigator.pop(context);
    }
        });
  }

  void mesajGoster(context, sonuc) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(sonuc),
    );
    showDialog(
        context: context,
        barrierColor: Colors.black12,
        builder: (BuildContext context) => alert);
  }

  Widget buildGender() {
    int _value=1;
    return DropdownButton(
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text("Erkek"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("Kadın"),
            value: 0,
          ),
        ],
      onChanged: (int value){
        setState(() {
          _value = value;
          student.gender = _value;
        });
      },
        );
  }
}











