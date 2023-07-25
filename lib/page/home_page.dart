import 'package:arm_health/controller/patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/asset.dart';
import '../config/color.dart';
import '../controller/newpatient_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PatientController patientController = Get.put(PatientController());
  final PatientController patientController2 = Get.find();
  final formkey = GlobalKey<FormState>();
  // TextEditingController patientname = TextEditingController();
  // TextEditingController age = TextEditingController();
  // TextEditingController bloodpressure = TextEditingController();

  // submitdata() {
  //   String? patientname1 = patientname.text;
  //   int? age1 = int.parse(age.text);
  //   String? bloodpressure1 = bloodpressure.text;
  //   Map<String, dynamic> data = {
  //     "patient_name": patientname1,
  //     "age": age1,
  //     "blood_pressure": bloodpressure1,
  //   };
  //   patientController.submit(data);

  //   patientname.clear();
  //   age.clear();
  //   bloodpressure.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetConfig.bg), fit: BoxFit.fill)),
      ),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "To continue, please fill in all fields:",
                style: TextStyle(
                  color: Color(0xFF013674),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Patient’s Name:',
                style: TextStyle(
                  color: Color(0xFF013674),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0, top: 10),
                      child: TextFormField(
                        controller: patientController.patientname,
                        validator: (value) =>
                            value == '' ? "Don't empty" : null,
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: Colors.transparent,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colorconfig.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Age:',
                      style: TextStyle(
                        color: Color(0xFF013674),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0, top: 10),
                      child: TextFormField(
                        controller: patientController.age,
                        validator: (value) =>
                            value == '' ? "Don't empty" : null,
                        decoration: InputDecoration(
                          // prefixIcon: const Icon(Icons.numbers),
                          filled: true,
                          fillColor: Colors.transparent,
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          hintText: 'Age',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colorconfig.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.black)),
                        ),
                      )),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Patien’s Blood Pressure:',
                          style: TextStyle(
                            color: Color(0xFF013674),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 50,
                          child: TextFormField(
                            controller: patientController.bloodpressure,
                            validator: (value) =>
                                value == '' ? "Don't empty" : null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.transparent,
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              // labelText: " / ",
                              // hintText: 'Age',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 60),
                        child: Text(
                          'mmHg',
                          style: TextStyle(
                            color: Color(0xFF013674),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Muscle Strength:',
                            style: TextStyle(
                              color: Color(0xFF013674),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Obx(() => DropdownButtonFormField<String>(
                                  value:
                                      patientController.selectedmusclestrength,
                                  // hint: Text('Pilih Kekuatan Otot'),
                                  items: patientController.musclestrengths
                                      .map((String strength) {
                                    return DropdownMenuItem<String>(
                                      value: strength,
                                      child: Text(strength),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    patientController
                                        .setselectedmusclestrength(newValue!);
                                  },
                                )),
                          ),
                        ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      children: [
                        const Text(
                          'Training Type:',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF013674),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                                width: 150,
                                child:
                                    Obx(() => DropdownButtonFormField<String>(
                                          value: patientController
                                              .selectedtrainingtype,
                                          items: patientController.trainingtypes
                                              .map((String type) {
                                            return DropdownMenuItem<String>(
                                              value: type,
                                              child: Text(type),
                                            );
                                          }).toList(),
                                          onChanged: (newValue) {
                                            patientController
                                                .setselectedtrainingtype(
                                                    newValue!);
                                          },
                                        ))),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colorconfig.secondary,
                    fixedSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    patientController.submitdata();
                  },
                  child: const Text('Finish'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Text(
                'DEVICE USAGE HISTORY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF013674),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ]),
    ]));
  }
}
