part of 'pages.dart';

class TicketPage extends StatefulWidget {
  final bool isExpiredTicket;

  TicketPage({this.isExpiredTicket = false});

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isExpiredTickets;

  @override
  void initState() {
    super.initState();

    isExpiredTickets = widget.isExpiredTicket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // note: CONTENTEN
          //
          // note: HEADER
          Container(
            height: 113,
            color: accentColor1,
          ),
          SafeArea(
              child: ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 113,
              color: accentColor1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(left: 24, bottom: 32),
                      child: Text(
                        "My Tickets",
                        style: whiteTextFont.copyWith(fontSize: 20),
                      )),
                  Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpiredTickets = !isExpiredTickets;
                              });
                            },
                            child: Text(
                              "Newest",
                              style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  color: !isExpiredTickets
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 4,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: !isExpiredTickets
                                ? Colors.black
                                : Colors.transparent,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpiredTickets = !isExpiredTickets;
                              });
                            },
                            child: Text(
                              "Oldest",
                              style: whiteTextFont.copyWith(
                                  fontSize: 16,
                                  color: isExpiredTickets
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 4,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: isExpiredTickets
                                ? Colors.black
                                : Colors.transparent,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(0, size.height, 20, size.height);
    path.lineTo(size.width - 20, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
