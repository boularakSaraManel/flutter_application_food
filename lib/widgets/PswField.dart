import 'package:flutter/material.dart';
import 'package:flutter_application_food/constantes.dart';
//import 'package:flutter_application_food/utils/api.dart';


class PswField extends StatefulWidget {
  static var psw;



  @override
  _PswFieldState createState() => _PswFieldState();
}


class _PswFieldState extends State<PswField> {
  bool passwordVisible = true ;
   var password ; 

 //getter and setter for password
  String get psw {
    return password;
  }
   set psw(String password) {
    this.password=password;
  }

  @override

   Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
           boxShadow: [ BoxShadow( 
             blurRadius: 15,
             color: Colors.grey.withOpacity(0.3),
             offset: Offset(7,8), )]),
      
      child: TextFormField(
        
          cursorColor: Gris,
          decoration: InputDecoration(
           border: InputBorder.none,
           hintText: "password",
           hintStyle: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Gris,),
         icon: IconButton(
           icon: Icon(
             passwordVisible ? Icons.visibility : Icons.visibility_off,
             ),
           iconSize: 18,
           onPressed: (){
             setState(() {
                          passwordVisible = ! passwordVisible;
                          });
             
          
           },
           

           
     color: Gris,
     
         ),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: passwordVisible,
          validator: (passwordValue) {
        if (passwordValue.isEmpty) {
          return 'Please enter password';
        }

        return null;
      },
      onChanged: (value) {
        password = value;
      },
          
          
      ),
 );
      
  }
}
