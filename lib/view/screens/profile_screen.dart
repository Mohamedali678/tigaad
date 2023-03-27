import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../controller/provider_data.dart';
import '../../shared/context.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  final _firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: _firestore
            .collection("user")
            .where("uid", isEqualTo: currentUser.currentUser!.uid)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 120,
                          ),
                          CircleAvatar(
                            radius: 55,
                            backgroundImage:
                                AssetImage("assets/images/logo.png"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 0.9,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.person,
                              size: 30,
                            ),
                            title: Text(
                              "${data["name"]}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 0.9,
                            color: Colors.black,
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.call,
                              size: 30,
                            ),
                            title: Text(
                              "${data["number"]}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )),

      //      Padding(
      //   padding: const EdgeInsets.all(20.0),
      //   child: Container(
      //     width: double.infinity,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: 60,
      //         ),
      //         CircleAvatar(
      //           radius: 50,
      //           backgroundImage: AssetImage("assets/images/logo.png"),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Text(
      //           "Name: Ahmad Ali",
      //           style: TextStyle(fontSize: 20),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Text(
      //           "Taleefan: 061321323",
      //           style: TextStyle(fontSize: 20),
      //         ),
      //       ],
      //     ),
      //   ),
      // )),
    );
  }
}
