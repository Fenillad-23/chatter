import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

 class FirebaseConfig {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final FirebaseFirestore storage = FirebaseFirestore.instance;

}
