import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tkchat/common/common.dart';

class MessageState {
  RxList<QueryDocumentSnapshot<Msg>> msgList =
      <QueryDocumentSnapshot<Msg>>[].obs;
}
