import 'package:android_path_provider/android_path_provider.dart';
import 'package:boxicons/boxicons.dart';
import 'package:femalert2/base/cards/helpline.cards.dart';
import 'package:femalert2/utils/colors.dart';
import 'package:femalert2/utils/sos.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../home/contacts.dart';
import '../home/profile.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/avtar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const Text("Hello Friend",
                              style: TextStyle(
                                color: ColorsValue.h5,
                                fontSize: 14,
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    username: 'FaithWanjiru',
                                    profileImageUrl: 'assets/images/avtar.png',
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Profile",
                              style: TextStyle(
                                color: ColorsValue.secondary,
                                fontSize: 14,
                              ),
                            ),
                          )


                        ],
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text("USIU Road ...",
                                  style: TextStyle(
                                    color: ColorsValue.h5,
                                    fontSize: 14,
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Send Location",
                                  style: TextStyle(
                                    color: ColorsValue.secondary,
                                    fontSize: 14,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Boxicons.bxs_map,
                            color: ColorsValue.secondary,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              const Text(
                "Emergency help \n Needed?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: ColorsValue.h1,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(400),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    splashColor: Colors.black54,
                    onTap: () async {
                      var downloadsPath =
                          await AndroidPathProvider.downloadsPath;

                      if (kDebugMode) {
                        print("$downloadsPath/ironman.jpeg");
                      }

                      await SOS().shareFile("$downloadsPath/ironman.jpeg");

                      // SOS.sharePhotoToWhatsApp("729944070",
                      //     "http://file:/$downloadsPath/digambar.jpeg");

                      if (kDebugMode) {
                        print("file:/$downloadsPath/digambar.jpeg");
                      }
                    },
                    child: Ink.image(
                      image: const AssetImage('assets/images/sos_button.png'),
                      height: 205,
                      width: 205,
                      fit: BoxFit.cover,
                      child: const Center(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Press the button to send SOS",
                style: TextStyle(
                  color: ColorsValue.h5,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        _callNumber("999");
                      },
                      child: HelpLineCards(
                        title: "Police",
                        assetImg: "assets/images/police_badge.png",
                        number: "100",
                      )),
                  InkWell(
                      onTap: () {
                        _callNumber("1195");
                      },
                      child: HelpLineCards(
                        title: "Womens Helpline",
                        assetImg: "assets/images/girl_badge.png",
                        number: "100",
                      ))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        _callNumber("112");
                      },
                      child: HelpLineCards(
                        title: "Ambulance",
                        assetImg: "assets/images/police_badge.png",
                        number: "100",
                      )),
                  InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => contacts()),
                );
              },
              child: HelpLineCards(
                title: "Trusted Contacts",
                assetImg: "assets/images/girl_badge.png",
                number: "100",
              )
            )

                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  _callNumber(String number) async {
//set the number here
    // ignore: unused_local_variable
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
}
