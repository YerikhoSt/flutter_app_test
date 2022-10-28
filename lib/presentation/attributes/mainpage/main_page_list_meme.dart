import 'package:flutter/material.dart';
import 'package:flutter_app_test/model/meme_model.dart';
import 'package:flutter_app_test/presentation/attributes/mainpage/main_page_meme_card.dart';
import 'package:flutter_app_test/services/server/server.dart';
import 'package:flutter_app_test/utils/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPageListMeme extends StatefulWidget {
  const MainPageListMeme({super.key});

  @override
  State<MainPageListMeme> createState() => _MainPageListMemeState();
}

class _MainPageListMemeState extends State<MainPageListMeme> {
  List<MemeModel> _listMeme = <MemeModel>[];

  bool _isLoading = false;

  Future<void> _getDataMeme() async {
    setState(() {
      _isLoading = true;
    });
    await fetchData('https://api.imgflip.com/get_memes').then((dynamic value) {
      setState(() {
        _isLoading = false;
      });
      for (final dynamic cb in value['data']['memes']) {
        final MemeModel val = MemeModel(
          id: cb['id'],
          name: cb['name'],
          url: cb['url'],
        );
        setState(() {
          _listMeme.add(val);
        });
      }
    });
  }

  @override
  void initState() {
    _getDataMeme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Column(
            children: <Widget>[
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 5.h),
              Text(
                'Data Loading...',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: Config.bold,
                    ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: _listMeme.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int i) {
              return MainPageMemeCard(
                meme: _listMeme[i],
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Material(
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image.network(
                        _listMeme[i].url,
                        width: MediaQuery.of(context).size.width,
                        height: 250.h,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
