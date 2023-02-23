import 'package:flutter/material.dart';
import 'package:flutterappfood/viewmodels/authentication.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthenticationViewModel provider =
        Provider.of<AuthenticationViewModel>(context);
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: SizedBox(
                        width: 150,
                        height: 100,
                        child: Image.network(
                          'https://www.shutterstock.com/image-vector/burger-vintage-stamp-sticker-vector-600w-644233561.jpg', // Replace with your logo image asset path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email or phone number',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        controller: _passwordController,
                        obscureText: true,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.amber)),
                        onPressed: () async {
                          if (await provider.emailandpasswordLogin(
                              "abc@gmail.com", "123456")) {
                          } else {}
                        },
                        child: Text('Sign In'),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Implement sign in logic here
                        },
                        child: const Text(
                          'Login with otp',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Implement forgot password logic here
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.amber),
                        ),
                      ),
                    ),
                    Row(children: [
                      const Expanded(
                          child: Divider(
                        color: Colors.black,
                      )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: const Text("Or")),
                      const Expanded(child: Divider(color: Colors.black)),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Card(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
