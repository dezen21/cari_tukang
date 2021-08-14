part of 'pages.dart';

class InteriorDetail extends StatefulWidget {
  @override
  _InteriorDetailState createState() => _InteriorDetailState();
}

class _InteriorDetailState extends State<InteriorDetail> {
  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    Future<void> handleBook(space) async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Konfirmasi'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                      'Apakah kamu ingin membooking pembuatan interior design?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Nanti',
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Hubungi'),
                onPressed: () {
                  Navigator.of(context).pop();
                  launchUrl('tel://6282234685920');
                },
              ),
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToMainPage());
        return;
      },
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // note: BACKDROP
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 280,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/available_interior.png'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            height: 280,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment(0, 1),
                                    end: Alignment(0, 0.06),
                                    colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0)
                                ])),
                          )
                        ],
                      ),
                      // note: BACK ICON
                      Container(
                        margin: EdgeInsets.only(top: 20, left: defaultMargin),
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.04)),
                        child: GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToMainPage());
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  // note: JUDUL
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 16, defaultMargin, 6),
                    child: Text(
                      "Interior Design",
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                  ),
                  // note: GENRE

                  SizedBox(
                    height: 6,
                  ),
                  // note: RATING
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.star,
                        color: Color(0xffC4C4C4),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "8/10",
                        style: TextStyle(color: Color(0xffADADAD)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  // note: CREDITS
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        margin:
                            EdgeInsets.only(left: defaultMargin, bottom: 12),
                        child: Text(
                          "Tukang & Crew",
                          style: blackTextFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )),
                  ),
                  //Nama-nama Tukang
                  Container(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        TukangCard(Tukang(
                            id: 1,
                            name: 'Gito',
                            imageUrl: 'assets/tukang1.png')),
                        SizedBox(
                          width: 5,
                        ),
                        TukangCard(Tukang(
                            id: 2,
                            name: 'Rohmat',
                            imageUrl: 'assets/tukang2.png')),
                        SizedBox(
                          width: 3,
                        ),
                        TukangCard(Tukang(
                            id: 1,
                            name: 'Siswo',
                            imageUrl: 'assets/tukang3.png')),
                        SizedBox(
                          width: 5,
                        ),
                        TukangCard(Tukang(
                            id: 1,
                            name: 'Parno',
                            imageUrl: 'assets/tukang4.png')),
                      ],
                    ),
                  ),
                  // note: STORYLINE
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 10, defaultMargin, 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Description",
                        style:
                            blackTextFont.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 0, defaultMargin, 30),
                    child: Text(
                      "Interior design is the art and science of enhancing the interiorof a building to achieve a healthier and more aesthetically pleasing environment for the people using the space. An interior designer is someone who plans, researches, coordinates, and manages such enhancement projects.",
                      style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  // note: BUTTON
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        primary: mainColor,
                      ),
                      child: Text(
                        "Continue to Book",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      onPressed: () {
                        handleBook(widget);
                      }),
                  SizedBox(height: defaultMargin),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }
}
