import 'package:arm_health/model/patient_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/state_manager.dart';

class PatientController extends GetxController {
  final TextEditingController patient_name = TextEditingController();
  final TextEditingController age = TextEditingController();
  TextEditingController blood_pressure = TextEditingController();
  //mengisi text controller dengan text default
  @override
  void onInit() {
    super.onInit();
    blood_pressure = TextEditingController(text: '  /  ');
  }

  @override
  void dispose() {
    blood_pressure.dispose();
    super.dispose();
  }

  //state untuk dropdown
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

  final CollectionReference patientsCollection =
      FirebaseFirestore.instance.collection('Patient');
  //mendefinisikan countersDoc sebagai referensi ke collection counters dengan id patientId
  final DocumentReference countersDoc =
      FirebaseFirestore.instance.collection('counters').doc('patientId');

  //fungsi untuk menyimpan pada firebase
  Future<void> savePatient() async {
    try {
      //mendapatkan nomor id terakhir pasien
      final transactionResult =
          await FirebaseFirestore.instance.runTransaction((transaction) async {
        final docSnapshot = await transaction.get(countersDoc);
        final lastPatientId =
            (docSnapshot.data() as Map<String, dynamic>)['lastId'] ?? 0;
        final newPatientId = lastPatientId + 1;
        transaction.update(countersDoc, {'lastId': newPatientId});
        return newPatientId;
      });
      final newPatientId = transactionResult as int;
      //buat data pasien baru
      final newpatient = Patient(
          patientName: patient_name.text,
          age: int.parse(age.text),
          bloodPressure: blood_pressure.text,
          muscleStrength: int.parse(_selectedmusclestrength.value),
          trainingType: _selectedtrainingtype.value);
      // await patientsCollection.add(newpatient.toJson());
      //menambahkan data pasien baru dengan menggunakan id baru
      await patientsCollection
          .doc(newPatientId.toString())
          .set(newpatient.toJson());
      //mereset form
      resetForm();
      //menampilkan pesan berhasil
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
      print("Gagal menyimpan data pasien: $e");
      //menampilkan pesan gagal
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

  //fungsi untuk mengubah value yang terpilih pada dropdown
  void setselectedtrainingtype(String value) {
    _selectedtrainingtype.value = value;
  }

  void setselectedmusclestrength(String value) {
    _selectedmusclestrength.value = value;
  }

  void resetForm() {
    patient_name.clear();
    age.clear();
    blood_pressure.text = " / ";
    _selectedtrainingtype.value = "Shoulder";
    _selectedmusclestrength.value = "0";
  }
}
