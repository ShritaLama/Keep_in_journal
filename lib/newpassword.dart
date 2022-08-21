import 'package:flutter/material.dart';
import 'package:keepinjournal/home.dart';
import 'package:keepinjournal/login.dart';
class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,),


        ),
      ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                decoration: InputDecoration(
                  hintText: 'New Password',
                  labelText: 'New Password',

                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',

                  ),
                ),
              ),
              Container(

                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child:ElevatedButton(
                    onPressed:(){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>Mylogin()),
                      );
                    },
                    child: Text("Submit"),
                  )
              ),

            ],

          ),



        );

  }
}
