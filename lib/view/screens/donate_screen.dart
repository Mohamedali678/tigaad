import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

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
              Expanded(
                child: ListView.builder(
                    itemCount: 3,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("assets/images/forest.jpg"),

                                    // TO DO: Working progress bar
                                    LinearProgressIndicator(
                                      backgroundColor: Colors.green,
                                      color: Colors.green,
                                      minHeight: 30,
                                      value: 15,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Text(
                                      "Dhireynta Iskuulada",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        'djasndksndajksndakjsdnasjdnasjdnsajd\ndsdbsajdbsajkdbjsbdjksab\nbsdbsadaskjdbaskdsajdsja'),
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
                                        Text("Mogadishu")
                                      ],
                                    ),

                                    // 2
                                    Row(
                                      children: [
                                        Icon(Icons.golf_course_sharp),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("200 Geed")
                                      ],
                                    ),

                                    // 3
                                    Row(
                                      children: [
                                        Icon(Icons.location_city),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Iskuulada")
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
      ),
    );
  }
}
