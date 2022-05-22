import 'package:ace_dicoding_ahmad/gen/assets.gen.dart';
import 'package:ace_dicoding_ahmad/utils/Sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  String get profileUrl =>
      'https://storage.googleapis.com/ahmad-profile/selfie.jpeg';

  Widget get linearLoading =>
      SizedBox(height: 25, width: 25, child: LinearProgressIndicator());

  Widget get loading =>
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(height: 25, width: 25, child: CircularProgressIndicator()),
      );

  @override
  Widget build(BuildContext context) {
    print('h: ${MediaQuery.of(context).size.width}');
    currentContext = context;

    var w = 50.h;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            margin: EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text('Hello I\'m', style: TextStyle(fontSize: 26 - 6)),
                      SizedBox(height: 10),
                      Text(
                        'Ahmad Nashihuddien',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30 - 6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text('Mobile Developer',
                          style: TextStyle(fontSize: 26 - 6)),
                      SizedBox(height: 10),
                      _buildSocmed(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CachedNetworkImage(
                      imageUrl: profileUrl,
                      placeholder: (c, u) => linearLoading,
                      height: 25.w,
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50.h,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildProduct(
                      assetUrl:
                          'https://storage.googleapis.com/ahmad-profile/escm.png',
                      targetUrl:
                          'https://apps.apple.com/id/app/e-scm/id1418490255',
                      appName: 'E-SCM',
                      company: 'ICON+',
                      year: 2019,
                      width: w),
                  buildProduct(
                    assetUrl:
                        'https://storage.googleapis.com/ahmad-profile/seva.png',
                    targetUrl:
                        'https://play.google.com/store/apps/details?id=id.astra.adp.seva.partner',
                    appName: 'Seva Partner App (limited access)',
                    company: 'Astra International',
                    year: 2020,
                    width: w,
                  ),
                  buildProduct(
                    assetUrl:
                        'https://storage.googleapis.com/ahmad-profile/lingotalk.png',
                    targetUrl:
                        'https://play.google.com/store/apps/details?id=co.lingotalk',
                    appName: 'LingoTalk',
                    company: 'PT Intermedia Multibahasa Indonesia',
                    year: 2021,
                    width: w,
                  ),
                  buildProduct(
                    assetUrl:
                        'https://storage.googleapis.com/ahmad-profile/lingojunior.png',
                    targetUrl:
                        'https://play.google.com/store/apps/details?id=co.lingotalk.lingojunior',
                    appName: 'LingoJunior',
                    company: 'PT Intermedia Multibahasa Indonesia',
                    year: 2022,
                    width: w,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Made with ❤️ using Flutter',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    ));
  }

  Widget buildProduct({
    required String assetUrl,
    required String targetUrl,
    required String appName,
    required String company,
    required int year,
    required double width,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: SizedBox(
        width: width - 10,
        child: InkWell(
          onTap: () {
            launch(targetUrl);
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: CachedNetworkImage(
                    imageUrl: assetUrl, placeholder: (c, u) => loading),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appName, style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          company,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '$year',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLogoSocmed({required Widget asset, required String targetUrl}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          launch(targetUrl);
        },
        child: asset,
      ),
    );
  }

  Widget _buildSocmed() {
    var h = 3.h;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildLogoSocmed(
            asset: Assets.socmed.linkedin.svg(height: h),
            targetUrl: 'https://www.linkedin.com/in/nshdn'),
        buildLogoSocmed(
            asset: Image.asset(Assets.socmed.ig.path, height: h),
            targetUrl: 'https://www.instagram.com/ahmd.nshdn/'),
        buildLogoSocmed(
            asset: Assets.socmed.fb.svg(height: h),
            targetUrl: 'https://www.facebook.com/aiodh'),
        buildLogoSocmed(
            asset: Assets.socmed.github.svg(height: h),
            targetUrl: 'https://www.github.com/nashihu'),
      ],
    );
  }
}
