import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

import '../../../../core/services/supabase_service.dart';
import '../../../../core/services/toast_service.dart';
import '../models/user_model.dart';

class AuthService extends GetxService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final ToastService _toastService = Get.find<ToastService>();
  SupabaseClient get _supabase => SupabaseService.client;

  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    try {
      final existing = await _supabase
          .from('creators')
          .select('id')
          .eq('email', email.trim())
          .maybeSingle();

      if (existing != null) {
        _toastService.showErrorMessage("Email Already Exists");
        return null;
      }

      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      final User? user = userCredential.user;
      if (user == null) throw Exception("User Creation Failed");

      await _supabase.from('creators').insert({
        'firebase_uid': user.uid,
        'name': fullName.trim(),
        'email': email.trim(),
        'phone': phone.trim(),
        'avatar_url':
            'https://ui-avatars.com/api/?name=${Uri.encodeComponent(fullName)}',
      });

      await user.sendEmailVerification();
      _toastService.showSuccessMessage("Account Created Successfully!");
      return user;
    } on FirebaseAuthException catch (error) {
      _handleFirebaseAuthError(error);
      return null;
    } on PostgrestException catch (error) {
      _toastService.showErrorMessage(error.message);
      return null;
    } catch (error) {
      _toastService.showErrorMessage("An Unexpected Error Occurred");
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return userCredential.user;
    } on FirebaseAuthException catch (error) {
      _handleLoginFirebaseAuthError(error);
      return null;
    } catch (error) {
      _toastService.showErrorMessage("An Unexpected Error Occurred");
      return null;
    }
  }

  Future<bool> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.trim());
      return true;
    } on FirebaseAuthException catch (error) {
      _handlePasswordResetError(error);
      return false;
    } catch (error) {
      _toastService.showErrorMessage("Failed To Send Reset Email");
      return false;
    }
  }

  void _handleFirebaseAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case "network-request-failed":
        _toastService.showErrorMessage("Please Check Your Connection");
        break;
      case "too-many-requests":
        _toastService.showErrorMessage("Too Many Attempts");
        break;
      case "email-already-in-use":
        _toastService.showErrorMessage("Email Is Already Registered");
        break;
      case "weak-password":
        _toastService.showErrorMessage("Use A Stronger Password");
        break;
      case "invalid-email":
        _toastService.showErrorMessage("Invalid Email Address");
        break;
      case "operation-not-allowed":
        _toastService.showErrorMessage("Email/Password Accounts Not Enabled");
        break;
      default:
        _toastService.showErrorMessage("Registration Failed");
    }
  }

  void _handleLoginFirebaseAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case "network-request-failed":
        _toastService.showErrorMessage("Please Check Your Connection");
        break;
      case "too-many-requests":
        _toastService.showErrorMessage("Too Many Attempts");
        break;
      case "user-not-found":
        _toastService.showErrorMessage("No Account Found With This Email");
        break;
      case "wrong-password":
        _toastService.showErrorMessage("Incorrect Password");
        break;
      case "invalid-email":
        _toastService.showErrorMessage("Invalid Email Address");
        break;
      case "user-disabled":
        _toastService.showErrorMessage("Account Has Been Disabled");
        break;
      default:
        _toastService.showErrorMessage("Login Failed");
    }
  }

  void _handlePasswordResetError(FirebaseAuthException error) {
    switch (error.code) {
      case "invalid-email":
        _toastService.showErrorMessage("Invalid Email Address");
        break;
      case "user-not-found":
        _toastService.showErrorMessage("No Account Found With This Email");
        break;
      case "too-many-requests":
        _toastService.showErrorMessage("Too Many Attempts. Try Again Later");
        break;
      default:
        _toastService.showErrorMessage("Failed To Send Reset Email");
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  User? get currentUser => _firebaseAuth.currentUser;
  bool get isLoggedIn => _firebaseAuth.currentUser != null;
  bool get isEmailVerified => _firebaseAuth.currentUser?.emailVerified ?? false;

  Future<void> sendEmailVerification() async {
    final user = _firebaseAuth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<UserModel?> getUserData(String userId) async {
    try {
      final response = await _supabase
          .from('creators')
          .select()
          .eq('firebase_uid', userId)
          .maybeSingle();
      if (response == null) return null;
      return UserModel.fromSupabaseMap(response);
    } catch (error) {
      return null;
    }
  }

  Future<void> updateUserProfile({
    String? name,
    String? phone,
    String? profilePath,
  }) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user == null) return;

      final updateData = <String, dynamic>{};
      if (name != null) updateData['name'] = name.trim();
      if (phone != null) updateData['phone'] = phone.trim();
      if (profilePath != null) updateData['avatar_url'] = profilePath;
      updateData['updated_at'] = DateTime.now().toIso8601String();

      await _supabase
          .from('creators')
          .update(updateData)
          .eq('firebase_uid', user.uid);
    } catch (error) {
      _toastService.showErrorMessage("Failed To Update Profile");
    }
  }
}
