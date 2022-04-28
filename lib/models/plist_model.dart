class Pdetails{
  String? uid;
  String? pname;
  String? pphone;
  String? pstate;
  String? pcity;
  Pdetails({this.uid,this.pname,this.pphone,this.pcity,this.pstate});


//data from server
factory Pdetails.fromMap(map){
return Pdetails(
 uid:'uid',
  pname: 'pname',
  pphone: 'pphone',
  pcity: 'pcity',
  pstate: 'pstate'

);
}
//sending data to server
Map<String,dynamic> toMap(){
  return {
    'uid':uid,
    'pname':pname,
    'pphone':pphone,
    'pstate':pstate,
    'pcity':pcity
  };
}
}
