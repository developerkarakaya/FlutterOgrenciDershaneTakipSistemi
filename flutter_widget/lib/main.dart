import 'package:flutter/material.dart';
import 'package:flutter_widget/models/student.dart';
import 'package:flutter_widget/screens/student_add.dart';
import 'package:flutter_widget/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget // kendi widgetimi oluşturuyorum.
{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List Ogrenciler = [
    "Samet Karakaya",
    "Ahmet Emir Karakaya",
    "Hafsa Nur Karakaya",
    "Ali Ayaz Karakaya",
    "Ömer Bolat",
    "Mehmet Fatih Bolat"
  ];

  List<Student> students = [
    Student.WidthId(1,"Samet", "Karakaya", 42, 1),
    Student.WidthId(2,"Abdulrezzak", "Kıllıbacak", 21, 1),
    Student.WidthId(3,"Polat", "Alemdar", 58, 1),
    Student.WidthId(4,"Memati", "Baş", 35, 1),
    Student.WidthId(5,"Abdülhey", "Çoban", 70, 1),
    Student.WidthId(6,"Halide", "Kılıç", 66, 0),

  ];

  Student selectedStudent=Student.WidthId(0, "", "", 0, 0);
  String Mesaj = "Dershane Öğrenci Takip Sistemi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Mesaj),
      ),
      body: buildBody(context),
    );
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

  String sonucHesapla(int puan) {
    String sonuc;
    if (puan >= 50) {
      sonuc = "Geçti";
    } else if (puan >= 40) {
      sonuc = "Bütünleme";
    } else {
      sonuc = "Kaldı";
    }
    return sonuc;
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: Ogrenciler.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: buildBackImage(students[index].gender),
                  ),
                  title: Text(students[index].firstName +
                      " " +
                      students[index].lastName),
                  subtitle: Text("Sınavdan Aldığı Not : " +
                      students[index].grade.toString() +
                      " [" +
                      students[index].getStatus +
                      "]"),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });
                  /*  mesajGoster(
                        context,
                        students[index].firstName +
                            " " +
                            students[index].lastName +
                            " Ders Durumu : " +
                            sonucHesapla(students[index].grade)); */
                  },
                );
              }),
        ),
        Text("Seçili Öğrenci " + selectedStudent.firstName + " "+selectedStudent.lastName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
                flex:2,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Row(
                    children: [
                      SizedBox(width: 5,),
                      Icon(Icons.add,
                      color: Colors.white,),
                      Text(" Ekle"),
                    ],
                  ),
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
              },
            ))
            ,
            Flexible(
                fit: FlexFit.tight,
                flex:2,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.amber,
                  child: Row(
                    children: [
                      SizedBox(width: 5,),
                      Icon(Icons.update,
                        color: Colors.white,),
                      Text(" Güncelle"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
                  },
                ))
            ,Flexible(
                fit: FlexFit.tight,
                flex:2,
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Row(
                    children: [
                      SizedBox(width: 5,),
                      Icon(Icons.delete_forever,
                        color: Colors.white,),
                      Text(" Sil"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });
                    var sonuc = selectedStudent.firstName +" "+selectedStudent.lastName +" Kişisi Başarıyla Silindi.";
                    mesajGoster(context, sonuc);
                  },
                ))
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(
        Icons.done,
        color: Colors.green,
      );
    } else if (grade >= 40) {
      return Icon(
        Icons.album,
        color: Colors.yellow,
      );
    } else {
      return Icon(
        Icons.clear,
        color: Colors.red,
      );
    }
  }

  buildBackImage(int gender) {
    if (gender == 1) {
      return NetworkImage(
          "https://lh3.googleusercontent.com/l6xpcsDNQAGI5kE10JaqurVgPn1VFbepvX5CBiyGCWhwEtHGXvcqKYPO-gxsTH3MRnU");
    } else if (gender == 0) {
      return NetworkImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRrZNG2V1kv_IH_8aTfCrLyEYKVDuCeuKoHaQ&usqp=CAU");
    }
  }
}




































