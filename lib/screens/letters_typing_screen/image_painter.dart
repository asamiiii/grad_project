import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

class ImagePainter extends StatefulWidget {
  final String imageUrl;

  ImagePainter({required this.imageUrl});

  @override
  _ImagePainterState createState() => _ImagePainterState();
}

class _ImagePainterState extends State<ImagePainter> {
  List<Offset> points = [];
  late File imageFile;

  @override
  void initState() {
    super.initState();
    _saveNetworkImageLocally();
  }

  Future<void> _saveNetworkImageLocally() async {
    var response = await http.get(Uri.parse(widget.imageUrl));
    var documentDirectory = await getApplicationDocumentsDirectory();
    var filePath = '${documentDirectory.path}/image.png';
    imageFile = File(filePath);
    await imageFile.writeAsBytes(response.bodyBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Painter'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => _saveImage(),
          ),
        ],
      ),
      body: Container(
        child: GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              RenderBox renderBox = context.findRenderObject() as RenderBox;
              points.add(
                renderBox.globalToLocal(details.globalPosition),
              );
            });
          },
          child: CustomPaint(
            painter: ImagePainterCustomPainter(
              imageFile: imageFile,
              points: points,
            ),
            child: Image.file(imageFile),
          ),
        ),
      ),
    );
  }

  Future<void> _saveImage() async {
    RenderRepaintBoundary boundary = context.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 1.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    await imageFile.writeAsBytes(pngBytes);
    // Show a message or perform any other action after saving the image.
  }
}

class ImagePainterCustomPainter extends CustomPainter {
  final File imageFile;
  final List<Offset> points;

  ImagePainterCustomPainter({required this.imageFile, required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    if (imageFile.existsSync()) {
      final image = FileImage(imageFile);
      image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener((info, _) {
          paintImage(canvas: canvas, rect: Offset.zero & size, image: info.image);
        }),
      );
    }

    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    Path path = Path();
    if (points.length > 1) {
      path.moveTo(points[0].dx, points[0].dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
    }

    canvas.drawPath(path, paint);
  }

  void paintImage({required Canvas canvas, required Rect rect, required ui.Image image}) {
    final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
    final FittedSizes sizes = applyBoxFit(BoxFit.contain, imageSize, rect.size);
    final Rect inputSubrect = Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect = Alignment.center.inscribe(sizes.destination, rect);

    canvas.drawImageRect(image, inputSubrect, outputSubrect, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}