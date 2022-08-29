import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:looknote/providers/auth_provider.dart';
import '../../app/config/routes/routes.dart';
import '../../app/constants/asset_path.dart';
import '../../app/resource/fonts.dart';
import '../../app/resource/sized_box.dart';
import '../../app/resource/strings.dart';

class WorkThroughScreen extends StatefulWidget {
  const WorkThroughScreen({Key? key}) : super(key: key);

  @override
  _WorkThroughScreenState createState() => _WorkThroughScreenState();
}

class _WorkThroughScreenState extends State<WorkThroughScreen> {
  int _currentPage = 0;

  final PageController _controller = PageController();

  _onChangePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  _onTapNext() {
    if (_currentPage == workThroughTitles.length - 1) {
      context.read<AuthProvider>().enteredIn = true;
      Navigator.pushNamed(context, LookNoteRouteNames.login);
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: workThroughTitles.length,
              onPageChanged: _onChangePage,
              itemBuilder: (context, int index) {
                return WorkThroughPage(
                  image:
                      '${ImagePath.workThrough}/work_through_${index + 1}.png',
                  title: workThroughTitles[index],
                  description: workThroughDescription[index],
                );
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(workThroughTitles.length,
                    (int index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10,
                    width: (index == _currentPage) ? 30 : 10,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Colors.black
                            : Colors.grey[400]),
                  );
                }),
              ),
              AnimatedContainer(
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                child: CupertinoButton(
                  child: Center(
                    child: Text(
                      (_currentPage == workThroughTitles.length - 1)
                          ? 'LookNote 시작하기'
                          : nextButtonTitle,
                      style: button1.copyWith(color: Colors.white),
                    ),
                  ),
                  onPressed: _onTapNext,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
//

class WorkThroughPage extends StatelessWidget {
  const WorkThroughPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          size100,
          Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          size20,
          Text(description, style: body2),
          size40,
          Image.asset(image),
        ],
      ),
    );
  }
}
