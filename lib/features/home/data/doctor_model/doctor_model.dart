class DoctorModel {
	String? userName;
	String? phone;
	String? email;
	String? address;
	String? appointment;
	int? detectionPrice;
	String? doctorSpecialization;
	dynamic password;

	DoctorModel({
		this.userName, 
		this.phone, 
		this.email, 
		this.address, 
		this.appointment, 
		this.detectionPrice, 
		this.doctorSpecialization, 
		this.password, 
	});

	factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
				userName: json['userName'] as String?,
				phone: json['phone'] as String?,
				email: json['email'] as String?,
				address: json['address'] as String?,
				appointment: json['appointment'] as String?,
				detectionPrice: json['detectionPrice'] as int?,
				doctorSpecialization: json['doctorSpecialization'] as String?,
				password: json['password'] as dynamic,
			);

	Map<String, dynamic> toJson() => {
				'userName': userName,
				'phone': phone,
				'email': email,
				'address': address,
				'appointment': appointment,
				'detectionPrice': detectionPrice,
				'doctorSpecialization': doctorSpecialization,
				'password': password,
			};
}
