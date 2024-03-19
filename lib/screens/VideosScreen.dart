import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../VideoCubit.dart';
import '../widgets/custom_text.dart';

class VideoScreen extends StatefulWidget {
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

List<String> subtitles = [
  'بناء القوة النفسية',
  'الاكتئاب',
  'استراتيجية بناء الذات',
  'التعلق المرضي',
  'Trust Issues',
  'اضطراب النوم',
  'الامتنان',
  'اضطراب الاكل',
  'الوسواس القهري',
  'ADHD',
  'التفكير المفرط',
  'الرهاب الاجتماعي',
  'فقدان الشغف'
];

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch video info when the screen initializes
    context.read<VideoCubit>().fetchVideoInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            SizedBox(
              height: 50,
              child: Padding(
                padding:  EdgeInsets.all(7),
                child: CustomText(
                  text: 'Videos',
                  fontSize: 25,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
            BlocConsumer<VideoCubit, List<List<VideoInfo>>>(
              listener: (context, state) {
              },
              builder: (context, videoInfos) {
                return videoInfos.isEmpty
                    ? _buildProgressIndicator(context) // Show progress indicator when data is being fetched
                    : RefreshIndicator(
                                      onRefresh: () => context.read<VideoCubit>().fetchVideoInfo(),
                                      child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: videoInfos.length,
                    itemBuilder: (context, index) {
                      if (index >= videoInfos.length) {
                        return SizedBox.shrink(); // Return an empty widget if index is out of bounds
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            child: Text(
                              subtitles[index],
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: videoInfos[index].length,
                            itemBuilder: (context, subIndex) {
                              final VideoInfo videoInfo = videoInfos[index][subIndex];
                              return GestureDetector(
                                onTap: () {
                                  VideoCubit().launchURL(videoInfo, index, subIndex); // Open YouTube video in web browser
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                                  child: Card(
                                    elevation: 5, // Add elevation shadow
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20), // Rounded corners
                                    ),
                                    color: const Color(0xFFADD8E6), // Pastel blue color
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        leading: Image.network(
                                          videoInfo.thumbnail,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        title: Text(
                                          videoInfo.title,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                                      ),
                                    );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return RefreshIndicator(
      color: const Color(0xFFADD8E6),
      onRefresh: () async {
        await context.read<VideoCubit>().fetchVideoInfo();
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height/2 - 100,),
            CircularProgressIndicator(
              color: const Color(0xFFADD8E6),
            ),
            SizedBox(height: 16),
            Text(
              'Loading Videos...',
              style: TextStyle(color: const Color(0xFFADD8E6)),
            ),
          ],
        ),
      ),
    );
  }
}
