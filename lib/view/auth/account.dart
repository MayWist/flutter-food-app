import 'package:flutter/material.dart';
import 'package:flutterappfood/model/choice_model.dart';
import 'package:flutterappfood/utility/constants.dart';

class Account extends StatelessWidget {
  Account({super.key});

  ListView topmenu = ListView.builder(
      itemCount: DUMMULISTSETTING.length,
      itemBuilder: ((context, index) {
        List<Choice> listsetting = DUMMULISTSETTING;
        listsetting.length;
        return Expanded(
          child: ListTile(
            leading: Icon(listsetting[index].icon),
            title: Text(listsetting[index].text),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        );
      }));
  ListView bottommenu = ListView.builder(
      itemCount: DUMMYLISTSERVICE.length,
      itemBuilder: ((context, index) {
        List<Choice> listservice = DUMMYLISTSERVICE;

        return Expanded(
          child: ListTile(
            leading: Icon(listservice[index].icon),
            title: Text(listservice[index].text),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        );
      }));
  String version = "1.0.95";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Account")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
                color: Colors.white30,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                elevation: 1,
                child: topmenu),
            Card(
              color: Colors.white30,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              elevation: 1,
              child: bottommenu,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: OutlinedButton.icon(
              onPressed: () {
                print('Button Clicked.');
              },
              icon: const Icon(Icons.logout),
              label: Text("Sign out"),
            )),
            Text("Version $version")
          ],
        ),
      ),
    );
  }
}
