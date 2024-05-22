import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(
        title: '',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  String tranche1 = "";
  String tranche2 = "";
  String timbre = "";
  String total = "";

  void calculerTotal() {
    String NN1Str = n1.text;
    String NN2Str = n2.text;

    if (NN1Str.isNotEmpty && NN2Str.isNotEmpty) {
      int NN1 = int.parse(NN1Str);
      int NN2 = int.parse(NN2Str);
      int result = NN1 - NN2;

      if (result >= 0) {
        if (result <= 6) {
          setState(() {
            tranche1 = " 1${(result * 2.37).toStringAsFixed(2)}";
            tranche2 = " 1${(result * 0.56).toStringAsFixed(2)}";
            double t = (result * 2.37) + (result * 0.56) + 9; // Adding 9 here
            double timb = t * 0.0025;
            double formattedTotal = double.parse((t + timb).toStringAsFixed(2));
            total = " $formattedTotal";
            double formattedTimbre = double.parse(timb.toStringAsFixed(5));
            timbre = " $formattedTimbre";
          });
        } else if (result >= 7 && result <= 11) {
          setState(() {
            int r = result - 6;
            tranche1 = " 2${((6 * 2.37) + (r * 7.39) + 9).toStringAsFixed(2)}";
            tranche2 = " 2${((6 * 0.56) + (r * 3.11) + 3).toStringAsFixed(2)}";

            double t = (6 * 2.37) +
                (r * 7.39) +
                (6 * 0.56) +
                (r * 3.11) +
                9; // Adding 9 here
            double timb = t * 0.0025;
            double formattedTotal = double.parse((t + timb).toStringAsFixed(2));
            total = " $formattedTotal";
            double formattedTimbre = double.parse(timb.toStringAsFixed(2));
            timbre = " $formattedTimbre";
          });
        } else if (result >= 12 && result <= 19) {
          setState(() {
            int r = result - 6;
            tranche1 = " 3--${((result * 7.39) + 6).toStringAsFixed(2)}";
            tranche2 =
                " 2--${((6 * 0.56) + (r * 3.11) + 3).toStringAsFixed(2)}";
            double t =
                (result * 7.39) + (6 * 0.56) + (r * 3.11) + 9; // Adding 9 here
            double timb = t * 0.0025;
            double formattedTotal = double.parse((t + timb).toStringAsFixed(2));
            total = " $formattedTotal";
            double formattedTimbre = double.parse(timb.toStringAsFixed(2));
            timbre = " $formattedTimbre";
          });
        } else if (result >= 20 && result <= 34) {
          setState(() {
            int r = result - 6;
            int r2 = r - 20;
            tranche1 = " 4--${((result * 10.98) + 6).toStringAsFixed(2)}";
            tranche2 =
                " 3--${((6 * 0.56) + (20 * 3.11) + (r2 * 3.96) + 3).toStringAsFixed(2)}";
            double t = (result * 10.98) +
                (6 * 0.56) +
                (20 * 3.11) +
                (r2 * 3.96) +
                9; // Adding 9 here
            double timb = t * 0.0025;
            double formattedTotal = double.parse((t + timb).toStringAsFixed(2));
            total = " $formattedTotal";
            double formattedTimbre = double.parse(timb.toStringAsFixed(2));
            timbre = " $formattedTimbre";
          });
        } else {
          setState(() {
            int r = result - 6;
            int r2 = r - 20;
            tranche1 = " 5--${((result * 11.03) + 6).toStringAsFixed(2)}";
            tranche2 =
                " 3--${((6 * 0.56) + (20 * 3.11) + (r2 * 3.96) + 3).toStringAsFixed(2)}";
            double t = (result * 11.03) +
                (6 * 0.56) +
                (20 * 3.11) +
                (r2 * 3.96) +
                9; // Adding 9 here
            double timb = t * 0.0025;
            double formattedTotal = double.parse((t + timb).toStringAsFixed(2));
            total = " $formattedTotal";
            double formattedTimbre = double.parse(timb.toStringAsFixed(2));
            timbre = " $formattedTimbre";
          });
        }
      } else {
        setState(() {
          tranche1 = "";
          tranche2 = "";
          timbre = "";
          total = "";
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Le résultat ne peut pas être négatif")),
        );
      }
    }
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/light-1.png'),
                              ),
                            ),
                          )),
                    ),
                    Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/light-2.png'),
                                ),
                              ),
                            ))),
                    Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 1400),
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/clock.png'),
                                ),
                              ),
                            ))),
                    Positioned(
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 2000),
                            child: Container(
                              margin: const EdgeInsets.only(top: 50),
                              child: const Center(
                                child: Text(
                                  "ONEE",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontFamily: "hh"),
                                ),
                              ),
                            )))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(112, 112, 112, 0.494),
                            blurRadius: 20.0,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade100)),
                            ),
                            child: Text(
                              "Les Informations De La Consomation",
                              style: TextStyle(
                                  fontFamily: 'hh',
                                  shadows: [
                                    Shadow(
                                        color: Colors.grey.shade600,
                                        offset: const Offset(2, 4),
                                        blurRadius: 4),
                                  ],
                                  fontSize: 15,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                          FadeInLeft(
                            duration: const Duration(milliseconds: 1000),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade100)),
                              ),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: n1,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.receipt,
                                    color: Colors.cyan,
                                  ),
                                  suffixIcon: IconButton(
                                    tooltip: "Clear",
                                    onPressed: () {
                                      n1.clear();
                                    },
                                    icon: const Icon(Icons.clear),
                                    color: Colors.red,
                                  ),
                                  labelStyle:
                                      TextStyle(color: Colors.blue[500]),
                                  labelText: "La Nouveau Index",
                                  enabledBorder: const OutlineInputBorder(
                                    // ignore: unnecessary_const
                                    borderSide: const BorderSide(
                                        color:
                                            Colors.black), // Set border color
                                  ), // Changed label to labelText
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.blue)),
                                  hintText: "",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                ),
                              ),
                            ),
                          ),
                          FadeInRight(
                            duration: const Duration(milliseconds: 1000),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: n2,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.receipt,
                                    color: Colors.cyan,
                                  ),
                                  suffixIcon: IconButton(
                                    tooltip: "Clear",
                                    onPressed: () {
                                      n2.clear();
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.red,
                                    ),
                                  ),
                                  labelStyle:
                                      TextStyle(color: Colors.blue[500]),
                                  labelText: "L'ancienne Index",
                                  hintText: "",
                                  hintStyle: TextStyle(color: Colors.grey[400]),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Colors.black), // Set border color
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        width: 2,
                                        color: Colors.blue), // Set border color
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Center rows horizontally
                      children: <Widget>[
                        // Your other widgets...
                        FadeInLeft(
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center elements horizontally within the row
                            children: [
                              const Text(
                                "Tranche:",
                                style: TextStyle(
                                    fontSize: 17, fontStyle: FontStyle.italic),
                              ),
                              Text(
                                tranche1,
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        FadeInRight(
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center elements horizontally within the row
                            children: [
                              const Text(
                                "Tranche:",
                                style: TextStyle(
                                    fontSize: 17, fontStyle: FontStyle.italic),
                              ),
                              Text(
                                tranche2,
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        FadeInLeft(
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center elements horizontally within the row
                            children: [
                              const Text(
                                "Timbre:",
                                style: TextStyle(
                                    fontSize: 17, fontStyle: FontStyle.italic),
                              ),
                              Text(
                                timbre,
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        FadeInRight(
                          duration: const Duration(milliseconds: 1000),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center elements horizontally within the row
                            children: [
                              const Text(
                                "Total:",
                                style: TextStyle(
                                    fontSize: 17, fontStyle: FontStyle.italic),
                              ),
                              Text(
                                total,
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                        // Your other widgets...
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 1000),
                      child: GestureDetector(
                        onTap: calculerTotal,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(0, 191, 255, 1),
                                Color.fromRGBO(104, 220, 255, 0.6),
                              ],
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Calculer",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "hh",
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FadeInLeft(
                      duration: const Duration(milliseconds: 1000),
                      child: GestureDetector(
                        onTap: () {
                          _launchURL("http://www.one.org.ma/");
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(15, 52, 67, 1),
                                Color.fromRGBO(52, 232, 158, 1),
                              ],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.language, // Globe icon
                                color: Colors.white,
                              ),
                              const SizedBox(
                                  width:
                                      8), // Add some spacing between the icon and text
                              const Text(
                                "Accéder au Site Officiel",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "hh",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
