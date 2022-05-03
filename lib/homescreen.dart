import 'package:demo/clist.dart';
import 'package:demo/login.dart';
import 'package:demo/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fooste'),backgroundColor: Colors.black,),
      body: Container(
    constraints: BoxConstraints.expand(),
    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage('assets/home1.png'),
    fit: BoxFit.cover,),
    ),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 40,),
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Clist()));
        },
      ),
      drawer: Drawer(
      //  child: SingleChildScrollView(
          child: Material(
            color: Colors.pinkAccent,
            child: Column(
              children: [
                SizedBox(height: 200,),
                ListTile(
                  leading:Icon(Icons.home,color:Colors.black ,),
                  title: Text('Home',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Home()));
                  },
                ),
                ListTile(
                  leading:Icon(Icons.person,color: Colors.black,),
                  title: Text('Profile',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Profile()));
                  },
                ),
                ListTile(
                  leading:Icon(Icons.add_circle_rounded,color: Colors.black,),
                  title: Text('Add',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Clist()));
                  },
                ),
                ListTile(
                  leading:Icon(Icons.list,color: Colors.black,),
                  title: Text('My Listings',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onTap: (){},
                ),
                ListTile(
                  leading:Icon(Icons.logout,color: Colors.black,),
                  title: Text('Logout',style: TextStyle(fontSize: 20,color: Colors.black),),
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Login()));
                  },
                ),

              ],
            ),
          ),
        ),
      //),
    );
  }

 /* Widget DrawerList(){
    return Container(

      padding: EdgeInsets.fromLTRB(5.0, 200.0, 5.0, 200.0),
      child: Column(
        children: [
          menuItem()
        ],
      ),
    );
  }
 Widget menuItem(){
    return Material(
      color: Colors.pinkAccent[500],
      child: InkWell(
        onTap: (){},
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(child: Icon(Icons.home,size: 20.0,color: Colors.black,)),
              Expanded(flex:1,child: Text("Home",style: TextStyle(color: Colors.black,fontSize: 16),),),
            ],
          ),
          child: Row(
            children: [
            Expanded(child: Icon(Icons.home,size: 20.0,color: Colors.black,)),
            Expanded(flex:1,child: Text("Home",style: TextStyle(color: Colors.black,fontSize: 16),),),
          ],
          ),
        ),
      ),
    );
  } */
}

