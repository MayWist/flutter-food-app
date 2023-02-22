import 'package:flutter/material.dart';
import 'package:flutterappfood/model/choice_model.dart';
import 'package:flutterappfood/view/bottomnavbar.dart';
import 'package:flutterappfood/utility/constants.dart';

class Account extends StatelessWidget {
  Account({super.key});

  Widget topmenu = Expanded(
    child: ListView.builder(
      itemCount: DUMMULISTSETTING.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        Choice listsetting = DUMMULISTSETTING[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Icon(
                          listsetting.icon,
                          size: 20.0,
                        ),
                      ),
                      Text(
                        listsetting.text,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 10.0,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    ),
  );

  Widget bottommenu = Expanded(
    child: ListView.builder(
      itemCount: DUMMYLISTSERVICE.length,
      shrinkWrap: true,
      itemBuilder: ((context, index) {
        Choice listsetting = DUMMYLISTSERVICE[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Icon(
                          listsetting.icon,
                          size: 20.0,
                        ),
                      ),
                      Text(
                        listsetting.text,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 10.0,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    ),
  );
  String version = "1.0.95";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text("Account"),
          centerTitle: true,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  elevation: 2,
                  child: topmenu,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  elevation: 2,
                  child: bottommenu,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Card(
                      elevation: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.black,
                              ),
                              Text("Sign out",
                                  style: TextStyle(
                                    color: Colors
                                        .black, // set the text color to blue
                                  )),
                            ],
                          ),
                        ],
                      )),
                ),
                Text(
                  "Version $version",
                ),
              ],
            ),
          ),
        ),
       );
  }
}
