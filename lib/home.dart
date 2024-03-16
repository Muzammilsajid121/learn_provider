import 'package:flutter/material.dart';
import 'package:learn_provider/counter_model.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 @override
  Widget build(BuildContext context) {
    print("build");
   
    return Consumer<CounterModel>(
      //value give use excess to everything in Counter Model class
      builder: (context, value, child) => 
      
      Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                value.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            //first access to counter modal class
            final counter = context.read<CounterModel>();
            //increment
            counter.incrementCounter();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), 
      ),
    );
  }
}
