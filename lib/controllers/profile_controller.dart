import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezzy_mart_seller_app/const/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart';

class ProfileController extends GetxController {
  late QueryDocumentSnapshot snapshotData;
  var profileImgPath = ''.obs;

  var nameController = TextEditingController();
  var oldPassController = TextEditingController();
  var newPassController = TextEditingController();
  var profileImgLink = "";
  RxBool isloading = false.obs;
  // User? user;
  // Rx<UserProfile?> userData = Rx<UserProfile?>(null);
  // @override
  // void onInit() {
  //   super.onInit();
  //   loadUserData();
  // }
  // Future<void> loadUserData() async {
  //   try {
  //     user = currentUser;

  //     if (user != null) {
  //       final userDoc = await firestore
  //           .collection(usersCollection)
  //           .doc(currentUser!.uid)
  //           .get();
  //       final _userData = userDoc.data();

  //       if (_userData != null) {
  //         userData.value = UserProfile.fromFirestore(_userData);
  //       } else {
  //         debugPrint('User data is null.');
  //       }
  //     }
  //   } catch (error) {
  //     debugPrint('Error loading data from Firebase: $error');
  //   }
  // }

  changeProfileImage(context) async {
    try {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
    var fileName = basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$fileName';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));

    profileImgLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imgUrl}) async {
    var store = firestore.collection(vendorsCollection).doc(currentUser!.uid);

    await store.set({'name': name, 'password': password, 'imageUrl': imgUrl},
        SetOptions(merge: true));
    isloading(false);
  }

  changeAuthPasswird({email, password, newPassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(cred).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }
}
