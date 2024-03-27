import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('布局 Weight'),
      ),
      body: ListView(children: <Widget>[
        const Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('我是'), Text('一个'), Text('横向'), Text('布局1')],
        ),
        const Row(
          mainAxisSize: MainAxisSize.min,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('我是'), Text('一个'), Text('横向'), Text('布局2')],
        ),
        const Stack(
          alignment: Alignment(0, 0),
          children: <Widget>[
            Text('123'),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://avatars3.githubusercontent.com/u/14101776?v=4',
              ),
            ),
            Text('456'),
          ],
        ),
        IndexedStack(
          // 居中对齐，可以看上篇各种对齐方式详解
          alignment: Alignment.center,
          // 这里设置索引是 0
          index: 0,
          children: [
            // 黄色 300
            Container(
              width: 300,
              height: 300,
              color: Colors.orange,
            ),
            // 红色 200
            Container(
              width: 200,
              height: 200,
              color: Colors.red,
            ),
            // 蓝色 100
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ],
        ),
        const Wrap(
            spacing: 0,
            runSpacing: 10,
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            children: <Widget>[
              Text('AAAAAA'),
              Text('AAAAAA'),
              Text('AAAAAA'),
              Text('AAAAAA'),
              Text('AAAAAA'),
              Text('AAAAAA'),
              Text('BBBBBB'),
              Text('BBBBBB'),
              Text('BBBBBB'),
              Text('BBBBBB'),
              Text('BBBBBB'),
            ]),
        Row(
          children: [
            Flexible(
              // 第一个占用 1/6
              flex: 1,
              child: Container(height: 10, color: Colors.red),
            ),
            Flexible(
              // 第 2 个占用 2/6
              flex: 2,
              child: Container(
                  height: 10, color: const Color.fromARGB(255, 255, 0, 208)),
            ),
            Flexible(
              // 第 3 个占用 3/6
              flex: 3,
              child: Container(
                  height: 10, color: const Color.fromARGB(255, 38, 255, 0)),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      height: 20, color: Colors.red), // 这个Widget会扩展填满Row的剩余空间
                ),
                Container(
                    width: 100,
                    height: 20,
                    color: Colors.blue), // 这个Widget的宽度固定为100
              ],
            )),
        const RotatedBox(
          quarterTurns: 1, // 设置旋转的角度，1代表顺时针旋转90度
          child: Text(
            'Hello, RotatedBox!', // 需要旋转的子组件
          ),
        ),
        Transform(
          transform:
              Matrix4.translationValues(20.0, 0.0, 0.0), // 平移操作，x轴移动100.0
          child: Opacity(
            opacity: 0.5,
            child: Container(
                width: 100,
                height: 100,
                color: Colors.purple,
                child: const Text('我是动画盒')),
          ),
        ),
        Container(
            width: 100,
            height: 100,
            color: Colors.yellow,
            child: FractionallySizedBox(
              widthFactor: 0.2, // 宽度为父容器宽度的50%
              heightFactor: 0.2, // 高度为父容器高度的30%
              child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.pink,
                  child: const Text('我是伸缩盒')),
            )),
        const Baseline(
          baseline: 30, // 距离父容器顶部的距离，这里是30
          baselineType: TextBaseline.alphabetic, // 基准线类型设为字母基线
          child: Row(
            children: <Widget>[
              Text(
                'Hello',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                'Flutter',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
        Offstage(
          offstage: true, // 控制子Widget是否显示，true表示隐藏，false表示显示
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
            child: const Center(
              child: Text('Hidden Widget'),
            ),
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: ShapeDecoration(
            color: Colors.blue, // 设置背景颜色
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 圆角
            ),
            shadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // 阴影颜色和透明度
                spreadRadius: 5, // 扩散范围
                blurRadius: 7, // 模糊半径
                offset: const Offset(0, 3), // 阴影偏移量
              ),
            ],
          ),
        ),
        Container(
          width: 200,
          height: 200,
          decoration: ShapeDecoration(
            color: Colors.pink, // 设置背景颜色
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // 圆角
            ),
            shadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // 阴影颜色和透明度
                spreadRadius: 5, // 扩散范围
                blurRadius: 7, // 模糊半径
                offset: const Offset(0, 3), // 阴影偏移量
              ),
            ],
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: 50, //宽度尽可能大
              maxHeight: 50 //最小高度为50像素
              ),
          child: Container(
            height: 20,
            width: 20,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Text('123'),
            ),
          ),
        ),
        UnconstrainedBox(
            child: Container(
          color: const Color.fromARGB(255, 166, 172, 150),
          width: 50,
          height: 50,
          padding: EdgeInsets.only(left: 10),
          child: Text('size'),
        ))
      ]),
    );
  }
}
