class Patient {
  String? patientName;
  int? age;
  String? bloodPressure;
  int? muscleStrength;
  String? trainingType;

  Patient({
    this.patientName,
    this.age,
    this.bloodPressure,
    this.muscleStrength,
    this.trainingType,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientName: json["patient_name"],
        age: json["age"],
        bloodPressure: json["blood_pressure"],
        muscleStrength: json["muscle_strength"],
        trainingType: json["training_type"],
      );

  Map<String, dynamic> toJson() => {
        "patient_name": patientName,
        "age": age,
        "blood_pressure": bloodPressure,
        "muscle_strength": muscleStrength,
        "training_type": trainingType,
      };
}
