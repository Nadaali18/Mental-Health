import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'custom_text.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    Key? key,
    this.url1,
    this.text1,
    this.url2,
    this.text2,
  }) : super(key: key);

  final String? text1;
  final String? url1;
  final String? text2;
  final String? url2;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  void launchURL(String? url) async {
    if (url != null && await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  launchURL(widget.url1);
                },
                child: CustomText(
                  text: '${widget.text1}',
                  fontSize: 20,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 46, 157, 194),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  launchURL(widget.url2);
                },
                child: CustomText(
                  text: '${widget.text2}',
                  fontSize: 20,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 46, 157, 194),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
