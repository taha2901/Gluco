// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:gluco/features/chat/data/user_model.dart';
// import 'package:gluco/features/settings/data/profile/user.dart';

// class FireAuth {
//   static FirebaseAuth auth = FirebaseAuth.instance;
//   // عملنا ستاتيك عشان يتيح الوصول ل اي مكان  ولو حشتها هيحصل مشكله ف ال سطر السادس ف ال auth
//   static FirebaseFirestore firestore = FirebaseFirestore.instance;

//   static User user = auth.currentUser!;

//   static Future createUser() async {
//     ChatUser chatUser = ChatUser(
//         id: user.uid,
//         name: user.displayName ?? '',
//         about: 'hello , iam using taha',
//         createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
//         email: user.email ?? '',
//         image: '',
//         lastActivated: DateTime.now().millisecondsSinceEpoch.toString(),
//         online: false,
//         pushToken: '');
//     await firestore.collection('users').doc(user.uid).set(chatUser.toJson());
//   }
// }

// // user.uid هنا ممكن يحصل ايرور علشا نهتبقا عاوز تعمل اي دي لكل يوزر 