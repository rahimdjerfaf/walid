import 'package:car_rental/app/modules/widgets/build_snack_error.dart';
import 'package:car_rental/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../data/models/user.dart';
import '../modules/widgets/loading.dart';

class AuthService extends GetxController {
  static AuthService to = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();
  @override
  void onReady() async {
    ever(firebaseUser, handleAuthChanged);

    firebaseUser.bindStream(user);

    super.onReady();
  }

  handleAuthChanged(_firebaseUser) async {
    //get user data from firestore
    if (_firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
    }

    if (_firebaseUser == null) {
      Get.offNamed(Routes.AUTH);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => _auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => _auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    return _db
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return UserModel.fromMap(snapshot.data()!);
      }
      return defaultUser;
    });
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return _db.doc('/users/${firebaseUser.value!.uid}').get().then(
        (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
  }

  //Method to handle user sign in using email and password
  signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    showLoadingIndicator();
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      hideLoadingIndicator();
    } on FirebaseAuthException catch (authEx) {
      hideLoadingIndicator();
      String error = "";
      switch (authEx.code) {
        case "user-not-found":
          error = "This account doesn't exist";
          break;
        case "insufficient-permission":
          error = "You don't have enough permission";
          break;

        case "invalid-argument":
          error = "Invalid email or password";
          break;
        case "invalid-credential":
          error = "Something went wrong! (invalid-credential)";
          break;
        case "invalid-email":
          error = "Invalid email adress";
          break;
        case "invalid-password":
          error = "Invalid password";
          break;
        default:
          error = "Something went wrong! check your connection (default)";
          break;
      }
      buildSnackError(error);
    }
  }

  //create the firestore user in users collection
  void _createUserFirestore(UserModel user, User _firebaseUser) {
    _db.doc('/users/${_firebaseUser.uid}').set(user.toJson());
    update();
  }

// User registration using email and password
  Future registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    showLoadingIndicator();
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((result) async {
        print('uID: ' + result.user!.uid.toString());
        print('email: ' + result.user!.email.toString());

        UserModel _newUser = UserModel(
          uid: result.user!.uid,
          email: result.user!.email!,
          name: name,
          photoUrl: "", //gravatarUrl
        );
        //create the user in firestore
        _createUserFirestore(_newUser, result.user!);
        hideLoadingIndicator();
      });
    } on FirebaseAuthException catch (authEx) {
      hideLoadingIndicator();
      String error = "";
      print(authEx.code);
      switch (authEx.code) {
        case "insufficient-permission":
          error = "You don't have enough permission";
          break;
        case "email-already-in-use":
          error = "This email adress is already exist";
          break;
        case "internal-error":
          error = "Invalid login or password";
          break;
        case "invalid-argument":
          error = "You don't have enough permission";
          break;
        case "invalid-credential":
          error = "Something went wrong! (invalid-credential)";
          break;
        case "invalid-email":
          error = "Invalid email adress";
          break;
        case "invalid-password":
          error = "Invalid password";
          break;
        default:
          error = "Something went wrong! (default)";
          break;
      }
      buildSnackError(error);
    }
  }

//password reset email
  Future<void> sendPasswordResetEmail({
    required String email,
  }) async {
    showLoadingIndicator();
    try {
      await _auth.sendPasswordResetEmail(email: email);
      hideLoadingIndicator();
      Get.snackbar(
          'auth.resetPasswordNoticeTitle'.tr, 'auth.resetPasswordNotice'.tr,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on FirebaseAuthException catch (error) {
      hideLoadingIndicator();
      Get.snackbar('auth.resetPasswordFailed'.tr, error.message!,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  // Sign out
  Future<void> signOut() {
    return _auth.signOut();
  }
}
