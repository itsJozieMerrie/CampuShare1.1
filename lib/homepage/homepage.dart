import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proj3/components/input_box.dart';

class Myhomepage extends StatefulWidget {

  const Myhomepage({
    super.key,
  });

  
  @override
  State<Myhomepage> createState() => _MyhomepageState();

  
}

class _MyhomepageState extends State<Myhomepage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body : SafeArea(
        child : SingleChildScrollView(
          child : Column(
            children: [
              Stack(
                children: <Widget>[
                  SvgPicture.asset('lib/svg/rectangle.svg'),

                  Padding(
                    padding : const EdgeInsets.fromLTRB(18, 10, 18, 0),
                    child : Row(
                      mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('lib/svg/menutab.svg',
                          height : 19.43,
                          width : 17,
                        ),
                        SvgPicture.asset('lib/svg/bellicon.svg',
                          height : 20.13,
                          width : 23,
                        ),
                      ],
                    ),
                  ),
                 
                  //header
                  Center(
                    child: Padding(
                      padding : const EdgeInsets.fromLTRB(0, 52, 0, 46),
                      child: Column(
                        children: [
                          Text(
                            "Lend, borrow, repeat",
                            style : GoogleFonts.poppins(
                              fontSize : 20,
                              color : Colors.white,
                              fontWeight : FontWeight.bold, 
                            ),
                          ),
                          
                        
                          Text(
                            'with ease!',
                            style : GoogleFonts.poppins(
                              fontSize : 20,
                              color : Colors.black,
                              fontWeight : FontWeight.bold, 
                            )
                          ),
                        ],
                      ),
                    ),
                  ),

                  //search bar
                  Center(
                    child : Padding(
                      padding : const EdgeInsets.fromLTRB(45, 133, 45, 0),
                      child :InputBox(
                        controller: searchController,
                        hintText: "Search for everything",
                        obscureText: false,
                         // decoration : InputDecoration(
                          //  borderSide : BorderSide()
                          //),

                      ),
                    ),
                  ),


                  //just for testing, sign out feature
                  Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(45, 250, 45, 0),
                        child: Column(
                          children: [
                            const Text(
                              'Signed in as',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              user.email!,
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 40),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                icon: const Icon(Icons.arrow_back, size: 32),
                                label: const Text(
                                  'Sign Out',
                                  style: TextStyle(fontSize: 24),
                                ),
                                onPressed: () => FirebaseAuth.instance.signOut(),
                            )
                          ],
                        )
                      )
                  )
                ],  
                
              )
            ],
          ),
        ),
      ),
    );
  }
}