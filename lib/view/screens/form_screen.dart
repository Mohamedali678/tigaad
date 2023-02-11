import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 45,
            ),
            Text(
              "Contact Us",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Magaca",
                  prefixIcon: Icon(Icons.access_alarm),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Taleefanka",
                  prefixIcon: Icon(Icons.access_alarm),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Meeqo geed",
                  prefixIcon: Icon(Icons.access_alarm),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: 230,
              child: Padding(
                padding: const EdgeInsets.only(left: 70, top: 10),
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                        fontSize: 29,
                      ),
                    )),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
