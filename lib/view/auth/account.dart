import 'package:flutter/material.dart';
import 'package:flutterappfood/model/choice_model.dart';
import 'package:flutterappfood/utility/constants.dart';
import 'package:flutterappfood/viewmodels/authentication.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  Account({super.key});

  Widget topmenu = ListView.builder(
    itemCount: DUMMULISTSETTING.length,
    shrinkWrap: true,
    itemBuilder: ((context, index) {
      Choice listsetting = DUMMULISTSETTING[index];
      return Row(
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
      );
    }),
  );

  Widget bottommenu = ListView.builder(
    itemCount: DUMMYLISTSERVICE.length,
    shrinkWrap: true,
    itemBuilder: ((context, index) {
      Choice listsetting = DUMMYLISTSERVICE[index];
      return Row(
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
      );
    }),
  );
  String version = "1.0.95";

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel provider =
        Provider.of<AuthenticationViewModel>(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("Account"),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              elevation: 1,
              child: topmenu,
            ),
            // Expanded(
            //   child: Card(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(6.0),
            //     ),
            //     elevation: 1,
            //     child: bottommenu,
            //   ),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.all(5.0),
            //   alignment: Alignment.center,
            //   child: InkWell(
            //     onTap: () {
            //       provider.signOut(context);
            //       Navigator.pushNamedAndRemoveUntil(
            //           context, "/BottomNavBar", (route) => false);
            //     },
            //     child: Card(
            //         elevation: 2,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Row(
            //               children: [
            //                 Icon(
            //                   Icons.logout,
            //                   color: Colors.black,
            //                 ),
            //                 Text("Sign out",
            //                     style: TextStyle(
            //                       color: Colors
            //                           .black, // set the text color to blue
            //                     )),
            //               ],
            //             ),
            //           ],
            //         )),
            //   ),
            // ),
            // Text(
            //   "Version $version",
            // ),
          ],
        ),
      ),
    );
  }
}
