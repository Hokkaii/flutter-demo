import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('组件传值'),
        ),
        body: const Center(
          child: Column(
            children: [ChildWeight1('child1'), ChildWeight2()],
          ),
        ));
  }
}

class ChildWeight1 extends StatelessWidget {
  final String parentText;
  const ChildWeight1(this.parentText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
      child: Text(parentText),
    );
  }
}

class ChildWeight2 extends StatefulWidget {
  const ChildWeight2({super.key});
  @override
  State<ChildWeight2> createState() => _ChildWeight2State();
}

class _ChildWeight2State extends State<ChildWeight2> {
  int count = 0;
  int oldCount = 0;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _ChildWeight2State &&
          runtimeType == other.runtimeType &&
          count == other.count;
          
  @override
  int get hashCode => count.hashCode;

 
  void _incrementCounter() => setState(() {
        count++;
      }); //修改计数器

  @override
  Widget build(BuildContext context) {
    return CountContainer(
        model: this, //将自身作为model交给CountContainer
        increment: _incrementCounter, //提供修改数据的方法
        child: const Counter());
  }
}

class CountContainer extends InheritedWidget {
  //方便其子Widget在Widget树中找到它
  static CountContainer of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<CountContainer>()
          as CountContainer;

  final Function() increment;
  // 在公共API中使用私有类型无效
  final _ChildWeight2State model;

  const CountContainer({
    super.key,
    required this.model,
    required this.increment,
    required Widget child,
  }) : super(child: child);

  // 判断是否需要更新
  @override
  bool updateShouldNotify(CountContainer oldWidget) {
    return model != oldWidget.model;
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});
  @override
  Widget build(BuildContext context) {
    //获取InheritedWidget节点
    CountContainer state = CountContainer.of(context);
    return Column(children: [
      Text(
          'Child2 You have pushed the button this many times: ${state.model.count}'),
      ElevatedButton(
        onPressed: () => state.increment(),
        child: const Text('increment'),
      ),
    ]);
  }
}
