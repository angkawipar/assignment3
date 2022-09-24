import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_process.dart';


class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _gamePrecess = GameProcess();
  var _feedbackText = "ทายเลข 1 ถึง 100";
  var _input;
  var _show = "";

  void _Process() {
    if (_show == "") {
      setState(() {
        _feedbackText = "กรุณาใส่เลข";
      });
    } else {
      _input = int.tryParse(_show);
      var result = _gamePrecess.doGuess(_input);
      var sum = _gamePrecess.guessCount.toString();
      if (result == -1) {
        setState(() {
          _feedbackText = "$_show :มากเกินไป";
          _show = "";
        });
      } else if (result == -2) {
        setState(() {
          _feedbackText = "$_show :น้อยเกินไป";
          _show = "";
        });
      } else {
        setState(() {
          _feedbackText = "$_show :ถูกต้อง (ทาย $sum ครั้ง)";
        });
      }
    }
  }

  Widget _Buttonnip(int num) {
    return Padding(
      padding: const EdgeInsets.all(4.0), //ระยะระหว่างปุ่ม
      child: InkWell(
        //การกด
        onTap: () {
          setState(() {
            if (num == -1) {
              _show = _show.substring(0, _show.length - 1);
            } else if (num == -2) {
              _show = "";
            }
          });
        },
        customBorder: const CircleBorder(), //ขนาดสี่เหลี่ยม
        child: Container(
            width: 60.0,
            height: 30.0,
            alignment: Alignment.center,//ตำแหน่งเลข
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),//ขอบมน
                shape: BoxShape.rectangle,
                border: Border.all(
                    color: Colors.grey,
                    width: 1.0)),
            child: num == -1
                ? const Icon(
              Icons.backspace_outlined,
              color: Colors.purple,
            ) //-1 เครื่องหมายลบ
                : const Icon(
              Icons.close,
              color: Colors.purple,
            ) //-2 X

        ),
      ),
    );
  }

  Widget _Buttonnum(int num) {
    return Padding(
      padding: const EdgeInsets.all(4.0), //ระยะระหว่างปุ่ม
      child: InkWell(
        //การกด
        onTap: () {
          setState(() {
            if(_show.length<=2) {
              if (num == 0 || num == 1 || num == 2 || num == 3 || num == 4 ||
                  num == 5 || num == 6 || num == 7 || num == 8 || num == 9) {
                _show = _show + num.toString();
              }
            }
          });
        },
        customBorder: CircleBorder(),
        child: Container(
          width: 60.0,
          height: 30.0,
          alignment: Alignment.center,
          //ตำแหน่งเลข
          decoration: BoxDecoration(//ปุ่มตัวเลข
              borderRadius: BorderRadius.circular(6.0), //ปรับความมนของขอบ
              shape: BoxShape.rectangle, //วงกลม
              border: Border.all(
                  color: Colors.grey, //สีขอบ
                  width: 1.0)),

          child: Text( //เลขในปุ่ม
            num.toString(),
            style: const TextStyle(fontSize: 16.0, color: Colors.purple),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GUESS THE NUMBER",//ขอบบน
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 20.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white70, //สีพื้นหลัง
                borderRadius: BorderRadius.circular(8.0), //ขอบมนสีม่วงอ่อน
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple.withOpacity(0.3), //เงา
                    blurRadius: 3,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "asset/image/guess_logo.png",
                        height: 90,
                        width: 90,
                      ),
                      Column(
                        children: const [
                          Text(
                            "GUESS",
                            style: TextStyle(
                                fontSize: 32.0, color: Colors.purpleAccent),
                          ),
                          Text(
                            "THE NUMBER",
                            style:
                            TextStyle(fontSize: 15.0, color: Colors.purple),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  Text(
                    _show,
                    style: GoogleFonts.chonburi(fontSize: 32.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    _feedbackText,
                    style: GoogleFonts.mitr(fontSize: 15.0),
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8.0),
                          _Buttonnum(1),
                          _Buttonnum(2),
                          _Buttonnum(3),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8.0),
                          _Buttonnum(4),
                          _Buttonnum(5),
                          _Buttonnum(6),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8.0),
                          _Buttonnum(7),
                          _Buttonnum(8),
                          _Buttonnum(9),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8.0),
                          _Buttonnip(-2),
                          _Buttonnum(0),
                          _Buttonnip(-1),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      ElevatedButton(
                        //ปุ่ม
                        onPressed: _Process,
                        style: OutlinedButton.styleFrom(
                          //ปุ่ม
                            backgroundColor: Colors.purple),
                        child: const Text("GUESS"),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//