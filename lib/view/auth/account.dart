import 'package:flutter/material.dart';
import 'package:flutterappfood/model/choice_model.dart';
import 'package:flutterappfood/utility/constants.dart';
import 'package:flutterappfood/viewmodels/authentication.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  Account({super.key});
  Widget topmenu = ListView.builder(
    itemCount: DUMMULISTSETTING.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: ((context, index) {
      Choice listsetting = DUMMULISTSETTING[index];

      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
        child: Row(
          // textBaseline: TextBaseline.ideographic,
          // mainAxisSize: MainAxisSize.min,
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
              height: 10,
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
  );
  Widget bottommenu = ListView.builder(
    itemCount: DUMMYLISTSERVICE.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: ((context, index) {
      Choice listsetting = DUMMYLISTSERVICE[index];
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.04,
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
  );
  String version = "1.0.95";
  Widget view = Container(
    color: Colors.blue,
    child: ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Group 1'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text('AAA'),
        ),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text('BBB'),
        ),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text('CCC'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Group 2'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text('111'),
        ),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text('222'),
        ),
        ListTile(
          leading: Icon(Icons.accessibility),
          title: Text('333'),
        ),
      ],
    ),
  );
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2,
              child: topmenu,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2,
              child: bottommenu,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                provider.signOut(context);
              },
              child: Card(
                  elevation: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                          const Text("Sign out",
                              style: TextStyle(
                                color:
                                    Colors.black, // set the text color to blue
                              )),
                        ],
                      ),
                    ],
                  )),
            ),
          ),
          Align(
            child: Text(
              "Version $version",
            ),
          ),
        ],
      ),
    );
  }
}
