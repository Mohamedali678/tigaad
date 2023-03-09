import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhir_app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class DonateScreen extends StatelessWidget {
  DonateScreen({super.key});

  late final collectionProgress = [];
  late double percentage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "Mashruucyada",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  'Dooro mashruucyadaan mid ka mid ah si aa ugu tabarucdo dhir beerista 🌱'),
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Campaigns')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    List<campaignModel> campaigns = [];
                    if (snapshot.data != null) {
                      // Add a null check here
                      snapshot.data!.docs.forEach((doc) {
                        campaigns.add(campaignModel(
                          doc.data()['imageUrl'],
                          doc.data()['targetAmount'],
                          doc.data()['currentAmount'],
                          doc.data()['title'],
                          doc.data()['description'],
                          doc.data()['city'],
                          doc.data()['numberOfTrees'],
                          doc.data()['type'],
                        ));
                        percentage = ((doc.data()['currentAmount'] /
                                doc.data()['targetAmount']) *
                            100);
                        collectionProgress.add(percentage);
                      });
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 470,
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: campaigns.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Card(
                                        shadowColor: Colors.black,
                                        color: Colors.grey.shade200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Image.network(campaigns[index]
                                                      .imageUrl),

                                                  // TO DO: Working progress bar
                                                  SizedBox(
                                                    height: 30,
                                                    child:
                                                        LinearProgressIndicator(
                                                      value: collectionProgress[
                                                              index] /
                                                          100, // The progress as a decimal between 0 and 1.
                                                      backgroundColor: Colors
                                                              .grey[
                                                          200], // The background color of the progress bar.
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors
                                                                  .green), // The color of the progress bar.
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      height:
                                                          10), // A small gap between the progress bar and the percentage display.
                                                  Text(
                                                    '${collectionProgress[index].round()}%',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),

                                                  Text(
                                                    campaigns[index].title,
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(campaigns[index]
                                                      .description),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  // 1
                                                  Row(
                                                    children: [
                                                      Icon(Icons.location_on),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                          campaigns[index].city)
                                                    ],
                                                  ),

                                                  // 2
                                                  Row(
                                                    children: [
                                                      Icon(Icons
                                                          .golf_course_sharp),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(campaigns[index]
                                                          .numberOfTrees)
                                                    ],
                                                  ),

                                                  // 3
                                                  Row(
                                                    children: [
                                                      Icon(Icons.location_city),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(campaigns[index]
                                                          .type),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      MaterialButton(
                                                        onPressed: () async {
                                                          final Uri url = Uri(
                                                            scheme: "tel",
                                                            path:
                                                                "*712*618907483*1#",
                                                          );
                                                          if (await canLaunchUrl(
                                                              url)) {
                                                            await launchUrl(
                                                                url);
                                                          } else {
                                                            print(
                                                                "Cannot launch");
                                                          }
                                                        },
                                                        color: Colors.green,
                                                        child: Text(
                                                          "Lacag bixi",
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ]),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
