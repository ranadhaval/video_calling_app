import 'package:flutter/material.dart';
import 'package:video_call_app/home.dart';
// ignore: depend_on_referenced_packages

// import 'package:hexcolor/hexcolor.dart';
class MyLogin extends StatelessWidget {
  MyLogin({Key? key}) : super(key: key);
  static String name = "";
  static String userId = "";
  final key_ = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text("User Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key_,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/new.jpeg"), fit: BoxFit.cover)),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(
                              "Assets/ui.png",
                            ),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "VIDEO CALLING APP",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      maxLength: 15,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) =>
                          val != null && !val.isEmpty ? null : "empty ",
                      onChanged: (val) {
                        name = val;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_pin_rounded),
                          hintText: "Name:-",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) =>
                        val != null && !val.isEmpty ? null : "empty ",
                    onChanged: (val) {
                      userId = val;
                    },
                    style: TextStyle(color: Colors.white, fontSize: 25),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.dataset_sharp),
                        hintText: "User Id:-",
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    final form = key_.currentState!.validate();

                    if (!form) {
                      print("validate");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please enter input fields'),
                        ),
                      );
                    } else {
                      try {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => MyHome(
                                      Tex: name,
                                    )),
                            (route) => false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Succesfully entred 🎉🎉🎉 on next step'),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.toString()),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  child: Container(
                    color: Colors.amber,
                    height: 60,
                    width: MediaQuery.of(context).size.width - 40,
                    child: Center(
                      child: Text("Start video call"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
