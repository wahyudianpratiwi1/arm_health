import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class PatientController extends GetxController {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref('Patient');
  TextEditingController patientname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController bloodpressure = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    bloodpressure = TextEditingController(text: '        /      ');
  }

  @override
  void dispose() {
    bloodpressure.dispose();
    super.dispose();
  }

  final RxString _selectedtrainingtype = "Shoulder".obs;
  final RxString _selectedmusclestrength = "0".obs;
  //daftar opsi dropdown
  final List<String> trainingtypes = [
    "Shoulder",
    "Upper Hand",
    "Elbow",
  ];
  final List<String> musclestrengths = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
  ];

  //mendapatkan value yang terpilih pada dropdown
  String get selectedtrainingtype => _selectedtrainingtype.value;
  String get selectedmusclestrength => _selectedmusclestrength.value;

  submitdata() {
    String? patientname1 = patientname.text;
    int? age1 = int.parse(age.text);
    String? bloodpressure1 = bloodpressure.text;
    Map<String, dynamic> data = {
      "patient_name": patientname1,
      "age": age1,
      "blood_pressure": bloodpressure1,
      "muscle_strength": selectedmusclestrength,
      "training_type": selectedtrainingtype,
    };
    updatedata(data);
    resetForm();
  }

  Future<void> updatedata(Map<String, dynamic> data) async {
    try {
      _databaseReference.update(data);
      Fluttertoast.showToast(
          msg: "Success Save Data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      print("Berhasil menyimpan data pasien");
    } catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: "Failed Save Data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }

  void setselectedtrainingtype(String value) {
    _selectedtrainingtype.value = value;
  }

  void setselectedmusclestrength(String value) {
    _selectedmusclestrength.value = value;
  }

  void resetForm() {
    patientname.clear();
    age.clear();
    bloodpressure.text = '        /      ';
    _selectedtrainingtype.value = "Shoulder";
    _selectedmusclestrength.value = "0";
  }
}
