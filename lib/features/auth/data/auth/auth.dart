class AuthModel {
	dynamic message;
	bool? isAuthenticated;
	String? username;
	String? email;
	List<dynamic>? roles;
	String? token;
	String? expiresOn;

	AuthModel({
		this.message, 
		this.isAuthenticated, 
		this.username, 
		this.email, 
		this.roles, 
		this.token, 
		this.expiresOn, 
	});

	factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
				message: json['message'] as dynamic,
				isAuthenticated: json['isAuthenticated'] as bool?,
				username: json['username'] as String?,
				email: json['email'] as String?,
				roles: json['roles'] as List<dynamic>?,
				token: json['token'] as String?,
				expiresOn: json['expiresOn'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'isAuthenticated': isAuthenticated,
				'username': username,
				'email': email,
				'roles': roles,
				'token': token,
				'expiresOn': expiresOn,
			};
}
