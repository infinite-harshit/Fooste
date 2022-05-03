import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/homescreen.dart';
import 'package:demo/login.dart';
import 'package:demo/models/plist_model.dart';
import 'package:demo/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Clist extends StatefulWidget {
  const Clist({Key? key}) : super(key: key);
  @override
  State<Clist> createState() => _ClistState();
}

class _ClistState extends State<Clist> {
  final formkey=GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController cnameController = new TextEditingController();
  final TextEditingController cphoneController = new TextEditingController();
  final TextEditingController ccityController = new TextEditingController();
  final TextEditingController itypeController = new TextEditingController();
  final TextEditingController pickuptimeController = new TextEditingController();
  final TextEditingController cstateController = new TextEditingController();
  final TextEditingController fcategoryController = new TextEditingController();
  final TextEditingController descriptionController = new TextEditingController();
  final TextEditingController ftypeController = new TextEditingController();
  final TextEditingController fquantityController = new TextEditingController();

  File? fimage;
  Future pickImage(ImageSource source) async {
    try{
      final fimage = await ImagePicker().pickImage(source:source);
      if(fimage==null)
        return;
      final imageTemp = File(fimage.path);
      setState(() => this.fimage = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }
  Widget build(BuildContext context) {
    //name
    final cnameField = TextFormField(
      autofocus: false,
      controller: cnameController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        cnameController.text=value!;
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
       //   fillColor: Colors.lightBlueAccent,
       //   filled: true,
          labelText: "Name",
          contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Name",
          border: UnderlineInputBorder(

          ),
      ),
    );

    //phone
    final cphoneField = TextFormField(
      autofocus: false,
      controller: cphoneController,
      keyboardType: TextInputType.phone,
      onSaved:(value) {
        cphoneController.text=value!;
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
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "Phone",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Phone",
        border: UnderlineInputBorder(),
      ),
    );



    final stateField = TextFormField(
      autofocus: false,
      controller: cstateController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        cstateController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("State name is required");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "State",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "State",
        border: UnderlineInputBorder(),
      ),
    );

    final cityField = TextFormField(
      autofocus: false,
      controller: ccityController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        ccityController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("City name is required");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "City",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "City",
        border: UnderlineInputBorder(),
      ),
    );

    final ptimeField = TextFormField(
      autofocus: false,
      controller: pickuptimeController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        pickuptimeController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("PickUp Time is required");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "PickUp Time",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "PickUp Time",
        border: UnderlineInputBorder(),
      ),
    );

    final ftypeField = TextFormField(
      autofocus: false,
      controller: ftypeController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        ftypeController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("Food type is required");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "Food Type",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Food type",
        border: UnderlineInputBorder(),
      ),
    );

    final fcategoryField = TextFormField(
      autofocus: false,
      controller: fcategoryController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        fcategoryController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("Category is required");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "Category",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Category",
        border: UnderlineInputBorder(),
      ),
    );


    final pimage =Align(
    alignment: Alignment.centerLeft,
    widthFactor:3.5,
    child:Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(5),

      color: Colors.black,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width*0.38,
        padding:EdgeInsets.fromLTRB(20, 15, 20, 15) ,
        onPressed: () {pickImage(ImageSource.camera);},
        child: Text("Image",
        style: TextStyle(color: Colors.amberAccent),),
      ),
    ),
    );

    final quantityField = TextFormField(
      autofocus: false,
      controller: fquantityController,
      keyboardType: TextInputType.text,
      onSaved:(value) {
        fquantityController.text=value!;
      },
      //validator
      validator: (value) {
        if (value!.isEmpty) {
          return ("Quantity is required");
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "Quantity",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Quantity",
        border: UnderlineInputBorder(),
      ),
    );

    final descriptionField = TextFormField(
      autofocus: false,

      controller: descriptionController,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      textInputAction: TextInputAction.done,
      onSaved:(value) {
        descriptionController.text=value!;
      },

      //textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        //   fillColor: Colors.lightBlueAccent,
        //   filled: true,
        labelText: "Description",
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Description",
        border: UnderlineInputBorder(),
      ),
    );
    final addData = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding:EdgeInsets.fromLTRB(20, 15, 20, 15) ,
        minWidth: MediaQuery.of(context).size.width,
        onPressed:() {
          addProduct(cnameController.text,cphoneController.text,ccityController.text,cstateController.text);
        },
        child:Text('Add',
            style: TextStyle(fontSize: 20,color: Colors.amberAccent,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
    );

    final back = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding:EdgeInsets.fromLTRB(20, 15, 20, 15) ,
        minWidth: MediaQuery.of(context).size.width,
        onPressed:() {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
        },
        child:Text('Back',
            style: TextStyle(fontSize: 20,color: Colors.amberAccent,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
      ),
    );
    return Scaffold(

        body: Stack(

          children: <Widget>[
            SingleChildScrollView(
            child:Container(
              color: Colors.amberAccent[100],
       /*     decoration: BoxDecoration(
              color: Colors.amberAccent[100],
            ),*/
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        cnameField,
                        cphoneField,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:[
                             Flexible(child: stateField),
                              Flexible(child:cityField)
                            ]
                          ),
                        ptimeField,
                        fcategoryField,
                        ftypeField,
                        SizedBox(height: 10,),
                        Row(
                            children:[
                        Flexible(child:fimage!=null?
                        Image.file(
                            fimage!,
                            width: 100,
                            height: 100,
                          fit: BoxFit.cover,
                          alignment: Alignment.centerLeft,
                        ) : Container(
                          width: 150,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Image'),
                          ),
                          decoration:
                          BoxDecoration(
                            border: Border.all(width: 1,color: Colors.black)
                          ),
                        ),
                        ),
                          SizedBox(width: 10,),
                          Flexible(child: quantityField)
                        ],
                        ),
                        SizedBox(height: 10,),
                        pimage,
                        SizedBox(height: 10,),
                        descriptionField,
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Flexible(child:back),
                            SizedBox(width: 5,),
                            Flexible(child: addData)
                          ],
                        ),
                        SizedBox(height:100,)
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

  void addProduct(String name,String phone,String city,String state,) async {
    if(formkey.currentState!.validate());
   // await _auth.
     postDetailsToFirestore();
  }


  postDetailsToFirestore() async {
    // calling our firestore
    // calling our productmodel
    // sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User?user = _auth.currentUser;

    Pdetails productModel = Pdetails();
    //writing all values
    productModel.uid = user!.uid;
    productModel.pname=cnameController.text;
   // productModel.pid=user!.pid;
    productModel.pphone=cphoneController.text;
    productModel.pcity=ccityController.text;
    productModel.pstate=ccityController.text;
    await firebaseFirestore.collection('product_list').doc(user.uid).set(productModel.toMap());
    Fluttertoast.showToast(msg: 'Account created successfully');
    Navigator.pushAndRemoveUntil((context),MaterialPageRoute(builder:(context)=>Home()),(route)=>false);

  }
}
