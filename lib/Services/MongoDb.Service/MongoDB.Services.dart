import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:sunshine/Services/MongoDb.Service/MongoDB.Credentials.dart';
import 'package:sunshine/UserData/GoogleUserData.dart';

class MongoDBServices{
  static var db, userCollection;
  // for connection to database
  static connect() async {
    try {
      // creating client
      db = await Db.create(MONGODB_CONN_URL);
      // opening connection to database
      await db.open();
      // establishing collection name
      userCollection = db.collection(USER_COLLECTION);
      // checking if connection was established with server or not
      if (db.isConnected) {
        log('Connected to MongoDB!');
      } else {
        log('Failed to connect to MongoDB!');
      }
    } catch (e) {
      // handle the exception
      log('Error connecting to MongoDB: $e');
    }
  }

  static Future<String> insert(GoogleUserInfo data) async {
    try {
      var res = userCollection.insertOne(data.toJson());
      if (res.isSuccess) {
        return "Data Inserted Successfully";
      } else {
        return "Something went wrong...";
      }
    } catch (e) {
      log(e.toString());
      return e.toString();
    }
  }
}