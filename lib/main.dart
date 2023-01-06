
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

void main() {
  runApp(const MyApp());
}


HandSignatureControl control = HandSignatureControl(
  threshold: 0.01,
  smoothRatio: 0.65,
  velocityRange: 2.0,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool get scrollTest => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hand Signature",style: TextStyle(fontSize: 15),),
      ),
        body: 
            SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return Stack(
                            children: <Widget>[
                              Container(
                                constraints: BoxConstraints.expand(),
                                color: Colors.white,
                                child: HandSignature(
                                  control: control,
                                  type: SignatureDrawType.shape,
                                ),
                              ),
                              CustomPaint(
                                painter: DebugSignaturePainterCP(
                                  control: control,
                                  cp: false,
                                  cpStart: false,
                                  cpEnd: false,
                                ),
                              ),
                            ],
                          );
                        }
                      ),
                    ),
                    Container(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: (){
                          control.clear();
                        }, 
                        child: Text("Clear")
                      ),
                    )
                  ],
                ),
              ),
      );
  }
}
