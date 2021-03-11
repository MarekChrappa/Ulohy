import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

FirebaseAnalytics analytics;

void main() {
  analytics = FirebaseAnalytics();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomeRoute(),
      '/second': (context) => SecondRoute(),
      '/third': (context) => ThirdRoute(),
    },
  ));
}

class HomeRoute extends StatelessWidget {


  void navigation(context, a)
  {
    analytics.setCurrentScreen(screenName: 'HomeRoute');

    if(a == 3)
    {
      analytics.logEvent(name: "PageChange_1to3");
      Navigator.pushNamed(context, '/third');

    }
    if(a == 2)
    {
      analytics.logEvent(name: "PageChange_1to2");
      Navigator.pushNamed(context, '/second');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Druha stranka'),
                onPressed: () {
                  navigation(context,2);
                },
              ),
              RaisedButton(
                child: Text('Tretia stranka'),
                onPressed: () {
                  navigation(context,3);
                },
              ),
            ],
          )),
    );
  }
}

class SecondRoute extends StatelessWidget {


  void navigation(context, a)
  {
    analytics.setCurrentScreen(screenName: 'SecondRoute');

    if(a == 3)
    {
      analytics.logEvent(name: "PageChange_2to3");
      Navigator.pushNamed(context, '/third');
    }
    if(a == 1)
    {
      analytics.logEvent(name: "PageChange_2to1");
      Navigator.pushNamed(context, '/');

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Druha stranka"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
        children: <Widget>[
          RaisedButton(
          onPressed: () {
            navigation(context,1);
          },
          child: Text('Home'),
        ),
          RaisedButton(
            child: Text('Tretia stranka'),
            onPressed: () {
              navigation(context,3);
            },
        ),
      ]
    )
    )
    );
  }
}

class ThirdRoute extends StatelessWidget {


  void navigation(context, a)
  {
    analytics.setCurrentScreen(screenName: 'ThirdRoute');

    if(a == 2)
    {
      analytics.logEvent(name: "PageChange_3to2");
      Navigator.pushNamed(context, '/second');
    }
    if(a == 1)
    {
      analytics.logEvent(name: "PageChange_3to1");
      Navigator.pushNamed(context, '/');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tretia stranka"),
          backgroundColor: Colors.green,
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      navigation(context,1);
                    },
                    child: Text('Home'),
                  ),
                  RaisedButton(
                    child: Text('Druha stranka'),
                    onPressed: () {
                      navigation(context,2);
                    },
                  ),
                ]
            )
        )
    );
  }
}