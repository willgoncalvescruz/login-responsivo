import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(DevicePreview(
      builder: (context) => const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  get logado => false;
  bool logadoB = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: "Login Responsivo",
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        locale: DevicePreview.locale(context),
        theme: ThemeData(),
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 203, 203, 203),
          body: SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                TextEditingController loginRaController =
                    TextEditingController();
                TextEditingController senhaController = TextEditingController();
                GlobalKey<FormState> _formKey = GlobalKey<FormState>();
                String _infoText = "Informe seus dados!";
                bool isButtonActive = false;
                if (kDebugMode) {
                  print(isButtonActive);
                }
                return Stack(
                  children: [
                    Center(
                      child: Container(
                        //color: Colors.grey,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: constraints.maxHeight * 0.40,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(4, 56, 139, 0.875),
                                image: DecorationImage(
                                  scale: 2.5,
                                  image: AssetImage(
                                    "assets/logo.png",
                                  ),
                                  //fit: BoxFit.contain,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color.fromRGBO(10, 3, 62, 0.886),
                                    Color.fromARGB(198, 2, 21, 144),
                                    Color.fromARGB(198, 2, 21, 144),
                                    Color.fromRGBO(196, 202, 212, 0.875),
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.elliptical(250, 100),
                                  bottomRight: Radius.elliptical(250, 100),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(
                                    /*  left: 20.0,
                                    right: 20.0, */
                                    bottom: 15,
                                    top: 20.0),
                                child: SizedBox(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      'RH On-Line',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Column(
                                  children: [
                                    logado == false
                                        ? SizedBox(
                                            width: constraints.maxWidth * 0.9,
                                            height:
                                                constraints.maxHeight * 0.07,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  logado == true;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          221, 8, 28, 162)),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Image.asset(
                                                        'assets/google.png',
                                                        width: 35,
                                                        height: 35,
                                                        fit: BoxFit.cover),
                                                  ),
                                                  const Center(
                                                      child: Text(
                                                          "Login pelo Google")),
                                                ],
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            width: constraints.maxWidth * 0.9,
                                            height:
                                                constraints.maxHeight * 0.07,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  logado == false;
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.grey[600]),
                                              child: const Text("Sair"),
                                            ),
                                          ),
                                    const SizedBox(
                                      width: 340,
                                      height: 5,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 100, 99, 98)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 0.0),
                                          child: SizedBox(
                                            width: constraints.maxWidth * 0.9,
                                            height:
                                                constraints.maxHeight * 0.07,
                                            child:
                                                //logadoRA = true ?
                                                ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      //foregroundColor:Colors.red,
                                                      backgroundColor:
                                                          Colors.white,
                                                      disabledForegroundColor:
                                                          const Color.fromARGB(
                                                              255, 1, 255, 9),
                                                    ),
                                                    onPressed: !logado
                                                        ? () {
                                                            setState(() =>
                                                                logadoB = true);
                                                            if (kDebugMode) {
                                                              print(logadoB);
                                                            }
                                                          }
                                                        : null,
                                                    child: const Text(
                                                      "Criar Conta",
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            198, 2, 21, 144),
                                                      ),
                                                    )),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 340,
                                          height: 5,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 100, 99, 98)),
                                          ),
                                        ),
                                        logadoB == true
                                            ? Column(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20,
                                                              top: 10),
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType.text,
                                                        decoration:
                                                            InputDecoration(
                                                          fillColor:
                                                              Colors.white70,
                                                          filled: true,
                                                          labelText: "Nome",
                                                          //isDense: true,
                                                          hintText:
                                                              ('Digite seu nome completo'),
                                                          contentPadding:
                                                              const EdgeInsets
                                                                  .all(10),
                                                          suffixStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .white),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16.0),
                                                        controller:
                                                            loginRaController,
                                                        // ignore: missing_return
                                                        validator: (value) {
                                                          if (value!.isEmpty) {
                                                            return "Usuário";
                                                          }
                                                          return null;
                                                        },
                                                      )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 20,
                                                      right: 20,
                                                      top: 10,
                                                    ),
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType
                                                              .emailAddress,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor:
                                                            Colors.white70,
                                                        filled: true,
                                                        labelText: "Email",
                                                        hintText:
                                                            ('Digite seu Email'),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0),
                                                      controller:
                                                          senhaController,
                                                      // ignore: missing_return
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return "Email";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 20,
                                                            top: 10,
                                                            bottom: 10),
                                                    child: TextFormField(
                                                      keyboardType:
                                                          TextInputType
                                                              .visiblePassword,
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor:
                                                            Colors.white70,
                                                        filled: true,
                                                        labelText: "Senha",
                                                        hintText:
                                                            ('Digite sua Senha'),
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        suffixStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                      ),
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16.0),
                                                      controller:
                                                          senhaController,
                                                      // ignore: missing_return
                                                      validator: (value) {
                                                        if (value!.isEmpty) {
                                                          return "Senha";
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            //top: 10.0,
                                                            bottom: 10.0),
                                                    child: SizedBox(
                                                      width:
                                                          constraints.maxWidth *
                                                              0.9,
                                                      height: constraints
                                                              .maxHeight *
                                                          0.07,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          // if (_formKey.currentState
                                                          //     .validate()) {
                                                          //   _calculate();
                                                          //   _showAlert(context);
                                                          //   //_resetFields();
                                                          // }
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        221,
                                                                        8,
                                                                        28,
                                                                        162)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: const [
                                                            Center(
                                                                child: Text(
                                                                    "Entrar")),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Updates the signed in state
  // refreshSignedInStatus() {
  //   msal.getSignedIn().then((loggedIn) {
  //     setState(() {
  //       var isSignedIn = loggedIn;
  //       print('###PRINT refreshSignedInStatus = isSignedIn => ${isSignedIn}');
  //       logado = isSignedIn;
  //       print("LOGADO => $logado");
  //     });
  //   });
  // }
}
