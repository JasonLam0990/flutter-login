import 'package:flutter/material.dart';

void main() => runApp(new LoginPage());

class LoginPage extends StatefulWidget{
  @override
  createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  int _counter = 3;

  final _userNameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  _decrementCounter() {

    setState(() {
      _counter--;
    });

    print({'username': _userNameTextController.text, 'password': _passwordTextController.text});

    if (_passwordTextController.text.length == 0 || _userNameTextController.text.length == 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('账号和密码不能为空'),
          ));
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('登录成功'),
          ));
      _userNameTextController.clear();
      _passwordTextController.clear();
    }

  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Login'),
        ),
        body: new Column(
          children: <Widget>[
            new Padding(
                padding:  new EdgeInsets.fromLTRB(70.0,70.0,70.0,40.0),
                child: new Center(
                  child: new Image.asset('images/me.jpg',width: 160.0,height: 160.0,),
                )
            ),

            new Padding(
                padding:  new EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                      child: new Image.asset('images/username.png', width: 30.0, height: 30.0, fit: BoxFit.fill,),
                    ),
                    /// 此组件会填满Row在主轴方向的剩余空间，撑开Row
                    new Expanded(child: new TextField(
                      decoration:  new InputDecoration(
                          hintText: '请输入用户名'
                      ),
                      controller: _userNameTextController,
                    ))
                  ],
                )
            ),

            new Padding(
                padding:  new EdgeInsets.fromLTRB(20.0, 0, 20.0, 15.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 15.0, 0.0),
                      child: new Image.asset('images/password.png', width: 30.0, height: 32.0, fit: BoxFit.fill,),
                    ),
                    new Expanded(child: new TextField(
                      decoration:  new InputDecoration(
                          hintText: '请输入密码'
                      ),
                      controller: _passwordTextController,
                      obscureText: true,
                    ))
                  ],
                )
            ),

            new Padding(
              padding: new EdgeInsets.all(20.0),
              child: new Center(
                child: new Text('可尝试的剩余次数：'+'$_counter',style: new TextStyle(color: Colors.grey, fontSize: 16.0),),
              ),
            ),

            new Padding(
                padding:  new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                child: new Container(
                  width: 340.0,
                  child: new Card(
                    color: Colors.blue,
                    elevation: 16.0,
                    child: new FlatButton(
                        onPressed: _decrementCounter,
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text('登陆',style: new TextStyle(color: Colors.white, fontSize: 16.0),),
                        )
                    ),
                  ),
                )
            ),
            new Padding(
                padding:  new EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                child: new Container(
                  width: 340.0,
                  child: new Card(
                    color: Colors.red,
                    elevation: 16.0,
                    child: new FlatButton(
                        onPressed:null,
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: new Text('退出',style: new TextStyle(color: Colors.white, fontSize: 16.0),),
                        )
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
