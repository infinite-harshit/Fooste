import 'package:demo/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:demo/homescreen.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController passwordController = new TextEditingController();
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();

  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    //email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
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
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          filled: true,
          prefixIcon: Icon(Icons.mail,
            color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
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
      onSaved: (value) {
        passwordController.text = value!;
      },
      //validator
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ('Password length minimum 6 characters');
        }
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          fillColor: Colors.lightBlueAccent,
          filled: true,
          prefixIcon: Icon(Icons.vpn_key,
            color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );

    //login button

    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.lightBlueAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          signIN(emailController.text, passwordController.text);
        },
        child: Text('Login',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
    );
    return Scaffold(

      body: Stack(
        children:[ Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/login.png'),
              fit: BoxFit.cover,),
          ),
      child:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(35.0),
            child: Form(

              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  Text('Welcome Back!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),
                  SizedBox(height: 30),
                  emailField,
                  SizedBox(height: 25),
                  passwordField,
                  SizedBox(height: 20),
                  loginbutton,
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an Account ? ",style: TextStyle(fontSize: 18),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Register()));
                        },
                        child: Text('Sign Up', style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: Colors.redAccent)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
      ),
        )],
      ),
    );
  }


//login function
  void signIN(String email, String password) async
  {
    if (formkey.currentState!.validate()){
      await _auth.signInWithEmailAndPassword(email: email, password: password).
      then((uid)=>{
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()))
    }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
  }
  }
}