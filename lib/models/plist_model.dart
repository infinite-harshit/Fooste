class Pdetails{
  String? uid;
  String? pname;
  String? pphone;
  String? pstate;
  String? pcity;
  String? pid;
  Pdetails({this.pid,this.uid,this.pname,this.pphone,this.pcity,this.pstate});


//data from server
factory Pdetails.fromMap(map){
return Pdetails(
 uid:'uid',
  pname: 'pname',
  pphone: 'pphone',
  pcity: 'pcity',
  pstate: 'pstate',
  pid:'pid',

);
}
//sending data to server
Map<String,dynamic> toMap(){
  return {
    'uid':uid,
    'pname':pname,
    'pphone':pphone,
    'pstate':pstate,
    'pcity':pcity,
    'pid':pid,
  };
}
}
