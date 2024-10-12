import 'dart:io'; 
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:lottie/lottie.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/ui/pages/result_page.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key, required this.image});
  final File? image;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Interpreter? _interpreter; // Nullable to handle loading
  List<String>? _labels; // Nullable labels until loaded

  @override
  void initState() {
    super.initState();
    _loadModel().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _imageClassification(widget.image);
      });
    });
  }

  @override
  void dispose() {
    _interpreter?.close();
    super.dispose();
  }

  // Load the model and labels
  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('assets/model_unquant.tflite');
      final labelsData = await rootBundle.loadString('assets/labels.txt');
      _labels = labelsData.split('\n');
    } catch (e) {
      print("Error loading model or labels: $e");
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('The image is unclear or unsupported. Please try again with a clearer image.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/main');  // Navigate back to homepage
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }


  // Image classification using the model
  void _imageClassification(File? image) async {
    if (image == null || _interpreter == null || _labels == null) {
      _showErrorDialog();  // Show dialog if there's an issue with the model or image
      return;
    }

    try {
      var imageInput = img.decodeImage(File(image.path).readAsBytesSync())!;
      img.Image resizedImage = img.copyResize(imageInput, width: 224, height: 224);

      var input = List.generate(1, (i) => List.generate(224, (j) => List.generate(224, (k) => List.filled(3, 0.0))));
      for (int y = 0; y < 224; y++) {
        for (int x = 0; x < 224; x++) {
          var pixel = resizedImage.getPixel(x, y);
          input[0][y][x][0] = (img.getRed(pixel) - 127.5) / 127.5;
          input[0][y][x][1] = (img.getGreen(pixel) - 127.5) / 127.5;
          input[0][y][x][2] = (img.getBlue(pixel) - 127.5) / 127.5;
        }
      }

      var output = List.filled(5, 0.0).reshape([1, 5]);

      _interpreter!.run(input, output);

      var result = output[0];
      var maxIndex = result.indexOf(result.reduce(max));

      setState(() {
        print(output![0]["label"]);
        Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              image: widget.image,
              pred: [_labels![maxIndex]],
            ),
          ),
        );
      });
      });
    } catch (e) {
      print("Error during inference: $e");
      _showErrorDialog();  // Show dialog if there's an error
    }
  }


  // Show dialog if image is unclear
  void _showUnclearImageDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Image Unclear"),
          content: const Text("The image is unclear and cannot be classified. Please try again with a clearer image."),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.of(context).pop(); // Navigate back to homepage
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: whiteColor,
          toolbarHeight: getProportionateScreenHeight(60),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(23)),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Scan',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We are scanning, please wait ...',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: blueColor,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(40)),
                child: Lottie.asset(
                  'assets/loading.json',
                  height: getProportionateScreenHeight(200),
                  width: getProportionateScreenWidth(200),
                ),
              ),
              Text(
                '“Cleanliness is the only way to keep\nall the diseases away.”',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: blueColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}