import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/homescreen.dart';
import 'package:demo/login.dart';
import 'package:demo/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formkey=GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController confirmpasswordlController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    //name
    final nameField = TextFormField(
      autofocus: false,
      controller: nameController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        nameController.text=value!;
      },
      //validator
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Name is required");
        }
        if (!regex.hasMatch(value)) {
          return ('Name length minimum 3 characters');
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          filled: true,
          prefixIcon:Icon(Icons.person,
            color: Colors.black,),
          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    //email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved:(value) {
        emailController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("PLease enter a valid email");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          filled: true,
          prefixIcon:Icon(Icons.mail,
            color: Colors.black,),
          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    //password
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved:(value) {
        passwordController.text=value!;
      },
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ('Password length minimum 6 characters');
        }
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          filled: true,
          prefixIcon:Icon(Icons.vpn_key,
            color: Colors.black,),
          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    //confirm password
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordlController,
      obscureText: true,
      onSaved:(value) {
        confirmpasswordlController.text=value!;
      },
      //validation
      validator: (value){
        if(confirmpasswordlController.text!=passwordController.text){
          return ("Password doesn't match");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          filled: true,
          prefixIcon:Icon(Icons.vpn_key,
            color: Colors.black,),
          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    //phone
    final phoneField = TextFormField(
      autofocus: false,
      controller: phoneController,
      keyboardType: TextInputType.phone,
      onSaved:(value) {
        phoneController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone number is required");
        }
        if (!RegExp(r'^(?:[+0]9)?[0-9]{10}$').hasMatch(value) ) {
          return ("PLease enter a valid phone number of 10 digit");
        }

        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          filled: true,
          prefixIcon:Icon(Icons.phone,
            color: Colors.black,),
          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    final back = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlueAccent,
      child: MaterialButton(
        padding:EdgeInsets.fromLTRB(20, 15, 20, 15) ,
        minWidth: MediaQuery.of(context).size.width,
        onPressed:() {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
        },
        child:Text('Back',
            style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
    );
    final update = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlueAccent,
      child: MaterialButton(
        padding:EdgeInsets.fromLTRB(20, 15, 20, 15) ,
        minWidth: MediaQuery.of(context).size.width,
        onPressed:() {
          signUp(emailController.text,passwordController.text);
        },
        child:Text('Update',
            style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Profile'),backgroundColor: Colors.black,),
      body:Stack(

        children:<Widget>[ Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/login.png'),
              fit: BoxFit.cover,),
          ),
          child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),

                    SizedBox(height: 20),
                    nameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmpasswordField,
                    SizedBox(height: 20),
                    phoneField,
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: back),
                        SizedBox(width: 30,),
                        Flexible(child: update)
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
        ],
      ),
    );

  }
  void signUp(String email,String password) async {
    if(formkey.currentState!.validate());
    await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {
      postDetailsToFirestore()
    }).catchError((e){
      Fluttertoast.showToast(msg: e!.message);
    });
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our usermodel
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User?user = _auth.currentUser;
    UserModel userModel = UserModel();
    //writing all values
    userModel.uid = user!.uid;
    userModel.email= user.email;
    userModel.name=nameController.text;
    userModel.phone=phoneController.text;
    await firebaseFirestore.collection('users').doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: 'Profile Updated');
    Navigator.pushAndRemoveUntil((context),MaterialPageRoute(builder:(context)=>Home()),(route)=>false);

  }
}
