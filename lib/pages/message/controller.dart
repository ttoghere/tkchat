import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tkchat/common/common.dart';
import 'package:tkchat/common/utils/http.dart';
import 'package:tkchat/pages/message/state.dart';
import 'package:location/location.dart';

class MessageController extends GetxController {
  final state = MessageState();
  MessageController();
  final token = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listener;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  String mapsIos = "AIzaSyAuCD63d5mPwb2hfkXGoddizrHjsuXWBVI";
  String mapsAndroid = "AIzaSyBsjRZiWKjm0MN-7j4I6PYItEZ4vmfN_oE";

  asyncLoadAllData() async {
    var from_message = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("from_uid", isEqualTo: token)
        .get();
    var to_message = await db
        .collection("message")
        .withConverter(
            fromFirestore: Msg.fromFirestore,
            toFirestore: (Msg msg, options) => msg.toFirestore())
        .where("to_uid", isEqualTo: token)
        .get();

    if (from_message.docs.isNotEmpty) {
      state.msgList.assignAll(from_message.docs);
    }
    if (to_message.docs.isNotEmpty) {
      state.msgList.assignAll(to_message.docs);
    }
  }

//Maps API for IOS
//
//Maps API for android
  getUserLocation() async {
    try {
      final location = await Location().getLocation();
      String address = "${location.latitude}, ${location.longitude}]";
      String url =
          "https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=${Platform.isIOS ? mapsIos : mapsAndroid}";
      var response = await HttpUtil().get(url);
      MyLocation location_res = MyLocation.fromJson(response);
      if (location_res.status == "OK") {
        String? myAddress = location_res.results?.first.formattedAddress;
        if (myAddress != null) {
          var user_location =
              await db.collection("users").where("id", isEqualTo: token).get();
          if (user_location.docs.isNotEmpty) {
            var doc_id = user_location.docs.first.id;
            await db
                .collection("users")
                .doc(doc_id)
                .update({"location": myAddress});
          }
        }
      }
    } catch (e) {}
  }

  void onRefresh() {
    asyncLoadAllData().then((_) {
      refreshController.refreshCompleted(resetFooterState: true);
    }).catchError((_) {
      refreshController.refreshFailed();
    });
  }

  void onLoading() {
    asyncLoadAllData().then((_) {
      refreshController.loadComplete();
    }).catchError((_) {
      refreshController.loadFailed();
    });
  }

  @override
  void onReady() {
    getUserLocation();
    super.onReady();
  }
}
