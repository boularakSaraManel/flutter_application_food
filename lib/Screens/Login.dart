// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_food/Screens/Fpswd.dart';
import 'package:flutter_application_food/Screens/SignUp.dart';
import 'package:flutter_application_food/constantes.dart';
import 'package:flutter_application_food/widgets/Button.dart';
//import 'package:flutter_application_food/Screens/splash.dart';
//import 'package:flutter_application_food/widgets/EmailField.dart';
//import 'package:flutter_application_food/widgets/PswField.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:flutter_application_food/utils/api.dart';


class LoginScreen extends StatefulWidget {
  
   final Icon icon ;
  final String htxt;
  final TextInputType type;

  const LoginScreen({Key key, this.icon, this.htxt, this.type}) : super(key: key);

  
  
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  

  //final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();//changed

  //get email => null;
  //get password => null;
  //BuildContext get context => null;
   
  var email;
  var password;
  bool passwordVisible = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //key: scaffoldKey,//changed

      body: Center(child: Padding (padding:EdgeInsets.symmetric(horizontal: 30 ),
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 30,),
               Image.asset('assets/images/Logo.png', 
                 height: 50,
                  width: 200,),
               Image.asset('assets/images/Signin.png',
               height: 300,
               width: 300,),
               SizedBox(height: 20,),
               
               //replaced by code
               /*EmailField( 
                  htxt: "email adresse",
                  icon: Icon(
                      Icons.email, 
                      size: 18,
                      color: Gris,
     
                      ),
                  type: TextInputType.emailAddress,
                ),*/

               
               Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [ BoxShadow( 
                            blurRadius: 15,
                            color: Colors.grey.withOpacity(0.3),
                            offset: Offset(5,8), )
                            ]),
      
                    child: TextFormField(
        
                        cursorColor: Gris,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: widget.htxt,
                          hintStyle: TextStyle(fontFamily: 'Montserrat',fontSize: 14,color: Gris,),
                          icon:widget.icon,
                           ),

                    keyboardType: widget.type,

                    validator: (emailValue) {  
                        if (emailValue.isEmpty) {
                          return 'Please enter email';
                         }
                        return null;
                      },

                         onChanged: (value) {
                           email = value;
                             },
        
          
          
                     ),

                     
                    ),
                     



                //PswField(),

                   Container(
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
                                       });},      
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
                   ),




               SizedBox(height: 25,),
              Button(
                press: (){
                    //Navigator.push(context, MaterialPageRoute(builder: (context){return SplashScreen();},),); 
                     _login();
                    },
                text: "Sign In",
              ),

               SizedBox(height: 20,),
               RichText(text: TextSpan(
                    text: 'Forgot password ? ',
                                     
                    style: TextStyle(decoration: TextDecoration.underline,
                                     color: Colors.black),
                           recognizer: TapGestureRecognizer()
                                     ..onTap = (){
                                       
                      Navigator.push(context, MaterialPageRoute(builder: (context){return Fpswd();},),); 
                          
                                     },
                                   ) ,
                                   ),
                SizedBox(height: 40,),
                 Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text('New member ? ' ,style: TextStyle(color: Jaune),),
                                   RichText(text: TextSpan(
                                     text: 'Create an account',
                                     
                                     style: TextStyle(decoration: TextDecoration.underline,
                                     color: Jaune),
                                     recognizer: TapGestureRecognizer()
                                     ..onTap = (){
                                       
                            Navigator.push(context, MaterialPageRoute(builder: (context){return SignUpScreen();},),); 
                          
                                     },
                                   ) ,
                                   ),
                                 ],
                               )
        ],),
      ),),),

    );
   }

 
_showMsg(msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    ));
  }
  


  void _login() async {
    // setState(() {
    //   _isLoading = true;
    // });
    var data = {'email': email, 'password': password};

    // var map = new Map<String, dynamic>();
    // map['email'] = email;
    // map['password'] = password;
    var response = await Network().postData(data, '/login');

    if (response.statusCode == 200) {
      //var body = json.decode(response.body);
      _showMsg(response.body);

      //SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', json.encode(body['token']));
      // localStorage.setString('user', json.encode(body['user']));
      // Navigator.push(
      //   context,
      //   new MaterialPageRoute(builder: (context) => Home()),
      // );
      //_showMsg(body['message']);

    } else {
      _showMsg('Error ${response.statusCode}');
    }

    // setState(() {
    //   _isLoading = false;
    // });
  
  }
 

}
 


 //<application android:usesCleartextTraffic="true"/> in case we can use unsecure http