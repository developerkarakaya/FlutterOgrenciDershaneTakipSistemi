import 'package:flutter/material.dart';
import 'package:flutter_widget/models/student.dart';
import 'package:flutter_widget/validation/validator.dart';

import '../main.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(Student selectedStudent) {
    this.selectedStudent=selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;
  _StudentAddState(Student selectedStudent) {
    this.selectedStudent=selectedStudent;
  }
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Güncelleme Sayfası"),
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
      initialValue: selectedStudent.firstName,
      decoration: InputDecoration(labelText: "Öğrenci Adı"),
      validator: ValidateFirstName,
      onSaved: (String value) {
        selectedStudent.firstName = value;
      },
    );
  }

  Widget buildLastName() {

    return TextFormField(
      initialValue: selectedStudent.lastName,
      decoration: InputDecoration(labelText: "Öğrenci Soyadı"),
      validator: ValidateLastName,
      onSaved: (String value) {
       selectedStudent.lastName = value;
      },
    );
  }

  Widget buildGrade() {
    return TextFormField(
      initialValue: selectedStudent.grade.toString(),
      decoration: InputDecoration(labelText: "Öğrenci Notu"),
      validator: ValidateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSaveButton() {
    return RaisedButton(
        child: Text("Kaydet"),
        onPressed: (){
          if(formKey.currentState.validate()) {
            formKey.currentState.save();
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
          selectedStudent.gender = _value;
        });
      },
    );
  }
}











