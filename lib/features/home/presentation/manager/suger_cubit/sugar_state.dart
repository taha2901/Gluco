
abstract class sugarstate {} 
class sugarsuccess extends sugarstate{}
class sugarloading extends sugarstate{}
class sugarerror extends sugarstate{
  String errormessage;
  sugarerror(this.errormessage);
}