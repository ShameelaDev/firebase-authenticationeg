import 'package:assignmentform/src/decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {

  bool obscuretext = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();




  final GlobalKey<FormState> formkey = GlobalKey<FormState>();



  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    // inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[a-z][A-Z]"))],
                    validator: (val){
                      String data = val??'';
                      if(data.trim().isEmpty)
                      {return 'please give your name';}
                      else
                      {return null;}
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Full Name"),


                  ),
                ),Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    validator: (val){
                      String data = val??'';
                      if(data.isEmpty)
                      {return 'please give Father name';}
                      else
                      {return null;}
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Father's Name"),

                  ),
                ),Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    validator: (val){
                      String data = val??'';
                      if(data.isEmpty)
                      {return 'please give your father address';}
                      else
                      {return null;}
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Father's Address"),

                  ),
                ),Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    validator: (val){
                      String data = val??'';
                      if(data.isEmpty)
                      {return 'please give your Mother';}
                      else
                      {return null;}
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Mother's Name"),

                  ),
                ),Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
                  child: TextFormField(
                    validator: (val){
                      String data = val??'';
                      if(data.isEmpty)
                      {return 'please give your Mother address';}
                      else
                      {return null;}
                    },
                    keyboardType: TextInputType.text,
                    decoration: buildInputDecoration(Icons.person,"Mother's Address"),

                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                    child: TextFormField(
                      controller: dateinput,

                      decoration: InputDecoration(

                          prefixIcon: Icon(Icons.calendar_today),
                          suffixIcon: IconButton(onPressed: ()async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context, initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101)
                            );

                            if(pickedDate != null ){
                              print(pickedDate);
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(formattedDate);

                              setState(() {
                                dateinput.text = formattedDate;
                              });
                            }else{
                              print("Date is not selected");
                            }
                          },
                            icon: Icon(Icons.arrow_drop_down_rounded),),//icon of text field
                          labelText: "DOB" ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))//lab

                      ),
                      readOnly: true,  //set it true, so that user will not able to edit text

                    )


                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    validator: (val){
                      if(val!.isEmpty)
                      {
                        return 'please enter email';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val))
                      {
                        return 'please enter a valid Email';
                      }
                      return null;
                    },

                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:buildInputDecoration(Icons.email,"Email"),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val){
                      String data = val??'';
                      if(data.isEmpty)
                      {return 'please give your Phone no';}
                      else if(data.length<10){
                        return "Phone no should be of 10 digits";
                      }
                      else
                      {return null;}
                    },
                    keyboardType: TextInputType.number,
                    decoration:buildInputDecoration(Icons.phone,"Phone No"),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    validator: (val){
                      String data = val??'';
                      if(data.isEmpty)
                      {return 'please give a password';}
                      else if(data.length<5)
                      { return 'password length should not be less than 5 character';}
                      else
                      {return null;}
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: obscuretext,

                    decoration: InputDecoration(
                        labelText: "password",
                        prefixIcon: Icon(Icons.lock),
                        suffix:obscuretext?IconButton(onPressed: () { setState(() {
                          obscuretext = false;
                        });}, icon: Icon(Icons.visibility)) : IconButton(onPressed: () { setState(() {
                          obscuretext=true;
                        });}, icon: Icon(Icons.visibility_off)),
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))

                    ),


                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 10,right: 10),
                  child: TextFormField(
                    validator: (val){
                      String data=val?? "";
                      if(data.isEmpty){
                        return "please re-enter password";
                      }
                      else if(passwordController.text!=confirmpasswordController.text)
                      {
                        return "password not match please re-enter";
                      }
                      else{
                        return null;
                      }
                    },
                    controller: confirmpasswordController,
                    obscureText: obscuretext,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        labelText: "Confirm password",
                        prefixIcon: Icon(Icons.lock),
                        suffix:obscuretext?IconButton(onPressed: () { setState(() {
                          obscuretext = false;
                        });}, icon: Icon(Icons.visibility)) : IconButton(onPressed: () { setState(() {
                          obscuretext=true;
                        });}, icon: Icon(Icons.visibility_off)),
                        contentPadding: EdgeInsets.all(4),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))

                    ),



                  ),
                ),

                SizedBox(
                  width: 200,
                  height: 50,

                ),
                ElevatedButton(onPressed: () {

                  if(!formkey.currentState!.validate())
                  {
                    return;
                  }
                  String email = emailController.text;
                  String password = passwordController.text;

                  print(email);
                  print(password);


                }, child: Text('Login'))

              ],
            ),

          ),

        ),
      ),
    );
  }
}
