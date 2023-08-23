import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:school_site/widgets.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CarouselController carouselController = CarouselController();

  final featuredImages = [
    'images/image1.png',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg'
  ];

  List<NavModel> navbarItems = [
    NavModel.activate("Home", true),
    NavModel("Admissions"),
    NavModel("Portal"),
    NavModel("Fees"),
    NavModel("News"),
    NavModel("About")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          header(),
          Expanded(
            child: SingleChildScrollView(child: activeEngine()),
          )
        ],
      ),
    );
  }

  Widget activeEngine() {
    Widget ret = Container();
    for (int i = 0; i < navbarItems.length; i++) {
      if (navbarItems[i].active) {
        switch (i) {
          case 0:
            ret = home();
            break;
          case 1:
            ret = admissions();
            break;
          case 2:
            ret = portal();
            break;
          case 3:
            ret = fees();
            break;
          case 4:
            ret = news();
            break;
          case 5:
            ret = about();
            break;
          default:
            ret = home();
            break;
        }
        break;
      }
    }
    return ret;
  }

  Widget home() => Column(
        children: [slider(), mission(), homeNews(), footer()],
      );

  Widget admissions() => Column(children: [advert()]);

  Widget portal() => Column(children: [login()]);

  Widget fees() => Column(children: [pay()]);

  Widget news() => Column(children: [homeNews()]);

  Widget about() => Column(children: [aboutBody()]);

  Widget header() {
    return Stack(children: [
      Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 20, 42, 245),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset("images/logo1.png")),
                h_space(10),
                text("COLLEGE DE MAZENOD\nJOS", Colors.white, 16,
                    FontWeight.w700, FontStyle.italic, 0.5),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              height: 18,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: navbarItems.length,
                itemBuilder: ((context, index) => InkWell(
                      onTap: (() {
                        for (int i = 0; i < navbarItems.length; i++) {
                          if (navbarItems[i].active) {
                            navbarItems[i].active = false;
                          }
                        }
                        setState(() {
                          navbarItems[index].active = true;
                        });
                      }),
                      child: navbarText(
                          navbarItems[index].item,
                          navbarItems[index].active
                              ? Color.fromARGB(255, 78, 226, 252)
                              : Colors.white),
                    )),
              ),
            ),
          ],
        ),
      ),
      Positioned(
          top: 0,
          right: 0,
          child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 224, 224, 224),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(18))),
              child: Row(
                children: [
                  text(
                      "For more enquiries, contact us via 08105634427",
                      Color.fromARGB(255, 16, 100, 18),
                      12,
                      FontWeight.w600,
                      FontStyle.normal,
                      1.2),
                  h_space(15),
                  Row(
                    children: [
                      Icon(
                        Icons.facebook_rounded,
                        color: Color.fromARGB(255, 33, 82, 243),
                      ),
                      h_space(5),
                      Icon(
                        Icons.whatsapp_rounded,
                        color: Color.fromARGB(255, 1, 122, 5),
                      )
                    ],
                  )
                ],
              ))),
    ]);
  }

  Widget slider() {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: CarouselSlider(
              carouselController: carouselController, // Give the controller
              options: CarouselOptions(
                  autoPlay: true, enlargeCenterPage: true, viewportFraction: 1),
              items: featuredImages.map((featuredImage) {
                return SizedBox(
                  width: double.maxFinite,
                  child: Image.asset(
                    featuredImage,
                    fit: BoxFit.cover,
                  ),
                );
              }).toList(),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                carouselController.previousPage();
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  carouselController.nextPage();
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget mission() {
    return Container(
      padding: EdgeInsets.all(15),
      color: Color.fromARGB(255, 20, 42, 245),
      width: double.maxFinite,
      child: Column(
        children: [
          text("MISSION", Colors.white, 18, FontWeight.w600, FontStyle.normal,
              1.3),
          v_space(10),
          text(
              "Our mission is to groom your kids to become better people in the society and the world at large by providing a safe and conducive environment where they can learn and enhance they skills. Enroll them with us and see the impacts of our trained teachers on your kids.",
              Color.fromARGB(255, 236, 235, 235),
              17,
              FontWeight.normal,
              FontStyle.normal,
              0.5)
        ],
      ),
    );
  }

  Widget homeNews() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text("NEWS AND EVENTS", Color.fromARGB(255, 43, 42, 42), 18,
              FontWeight.w800, FontStyle.normal, 1.0),
          v_space(15),
          news_card("first term examination begins", "12 Aug 2022"),
          news_card("mid-term break", "12 Sept 2022"),
          news_card("inter-house competition", "10 Mar 2022"),
          v_space(8),
          Center(
            child: text("See more . . .", Color.fromARGB(255, 20, 42, 245), 14,
                FontWeight.w400, FontStyle.normal, 0.5),
          )
        ],
      ),
    );
  }

  Widget footer() {
    return Container(
      padding: EdgeInsets.all(15),
      color: Color.fromARGB(255, 20, 42, 245),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          v_space(10),
          text("College de Mazenod Jos 2022\nEmail: collegedemazenod@gmail.com",
              Colors.white, 14, FontWeight.normal, FontStyle.normal, 0.8)
        ],
      ),
    );
  }

  Widget advert() {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.all(15),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border:
              Border.all(width: 0.5, color: Color.fromARGB(255, 110, 175, 228)),
          color: Color.fromARGB(232, 230, 228, 228)),
      child: Column(
        children: [
          text("ADMISSION FORMS ARE OUT!", Color.fromARGB(255, 54, 54, 54), 18,
              FontWeight.w700, FontStyle.normal, 1.0),
          v_space(20),
          text(
              "You can apply for admissions into nursery and primary school by filling and submittiong the form below.\n\nYou can equally download and print the form, fill it and submit to the school by clicking on the print button below.",
              Color.fromARGB(255, 54, 54, 54),
              15,
              FontWeight.w400,
              FontStyle.normal,
              1.1)
        ],
      ),
    );
  }

  Widget login() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
          color: Color.fromARGB(255, 240, 239, 239),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      width: double.maxFinite,
      child: Column(
        children: [
          text("STUDENT LOGIN", Color.fromARGB(255, 20, 42, 245), 18,
              FontWeight.w800, FontStyle.normal, 1.2),
          v_space(10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5, color: Color.fromARGB(255, 110, 175, 228)),
                //boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                color: Color.fromARGB(255, 255, 254, 254),
                borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                  hintText: "Username or Admission Number"),
            ),
          ),
          v_space(5),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 0.5, color: Color.fromARGB(255, 110, 175, 228)),
                //boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                color: Color.fromARGB(255, 255, 254, 254),
                borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              decoration: InputDecoration.collapsed(hintText: "Password"),
            ),
          ),
          v_space(8),
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                  color: Color.fromARGB(255, 20, 42, 245),
                  borderRadius: BorderRadius.circular(30)),
              child: text("LOGIN", Colors.white, 16, FontWeight.w500,
                  FontStyle.normal, 1.0)),
          v_space(8),
          text("Forgot password ?", Color.fromARGB(255, 68, 68, 68), 14,
              FontWeight.w400, FontStyle.normal, 0.2)
        ],
      ),
    );
  }

  Widget pay() {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
          color: Color.fromARGB(255, 240, 239, 239),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      width: double.maxFinite,
      child: Column(
        children: [
          text("PAY FEES", Color.fromARGB(255, 20, 42, 245), 18,
              FontWeight.w800, FontStyle.normal, 0.8),
          v_space(10),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(255, 78, 78, 78), blurRadius: 2)
                ],
                color: Color.fromARGB(255, 255, 254, 254),
                borderRadius: BorderRadius.circular(30)),
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                  hintText: " Enter student's Admission number"),
            ),
          ),
          v_space(15),
          Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                  color: Color.fromARGB(255, 20, 42, 245),
                  borderRadius: BorderRadius.circular(30)),
              child: text("MAKE PAYMENT", Colors.white, 15, FontWeight.w500,
                  FontStyle.normal, 0.8)),
          v_space(5),
        ],
      ),
    );
  }

  Widget aboutBody() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text("ABOUT SCHOOL", Color.fromARGB(255, 39, 39, 39), 20,
              FontWeight.w800, FontStyle.normal, 1.3),
          v_space(15),
          text(
              "Our mission is to groom your kids to become better people in the society and the world at large by providing a safe and conducive environment where they can learn and enhance they skills. Enroll them with us and see the impacts of our trained teachers on your kids.",
              Color.fromARGB(255, 65, 65, 65),
              17,
              FontWeight.normal,
              FontStyle.normal,
              0.5)
        ],
      ),
    );
  }
}

class NavModel {
  String item;
  bool active = false;
  NavModel(this.item);
  NavModel.activate(this.item, this.active);
}
