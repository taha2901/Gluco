class Auth {
	String? message;
	bool? isAuthenticated;
	String? username;
	String? email;
	List<dynamic>? roles;
	String? token;
	String? expiresOn;

	Auth({
		this.message, 
		this.isAuthenticated, 
		this.username, 
		this.email, 
		this.roles, 
		this.token, 
		this.expiresOn, 
	});

	factory Auth.fromJson(Map<String, dynamic> json) => Auth(
				message: json['message'] as String?,
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
