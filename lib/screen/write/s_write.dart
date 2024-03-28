import 'dart:io';
import 'dart:math';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:fast_app_base/entity/dummies.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_address.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/tab/home/provider/post_provider.dart';
import 'package:fast_app_base/screen/post_detail/provider/product_post_provider.dart';
import 'package:fast_app_base/screen/post_detail/s_post_detail.dart';
import 'package:fast_app_base/screen/write/d_select_image_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> with KeyboardDetector {
  final List<String> imageList = [];

  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    titleController.addListener(() {
      setState(() {});
    });
    priceController.addListener(() {
      setState(() {});
    });
    descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sell_my_thing', style: TextStyle(fontWeight: FontWeight.bold)).tr(),
        actions: [
          Tap(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('temp_save').tr(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ImageSeletWidget(
                imageList,
                onTapDeletedImage: (imagePath) {
                  setState(() {
                    imageList.remove(imagePath);
                  });
                },
                onTap: () async {
                  final selectedSource = await SelectImageSourceDialog().show();
                  if (selectedSource == null) {
                    return;
                  }
                  try {
                    final file = await ImagePicker().pickImage(source: selectedSource);
                    if (file == null) return;
                    setState(() {
                      imageList.add(file.path);
                    });
                  } on PlatformException catch (e) {
                    //MessageDialog('지원하지 않는 이미지입니다').show();
                    // await Permission.photos.request();
                  } catch (e) {
                    MessageDialog(e.toString()).show();
                  }
                },
              ),
              const Height(10),
              _TitleEditor(titleController),
              const Height(30),
              _PriceEditor(priceController),
              const Height(30),
              _DescEditor(descriptionController),
              //SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 60),
            ],
          ),
        ),
      ),
      bottomSheet: isKeyboardOn
          ? null
          : RoundButton(
              height: 50,
              borderRadius: 8,
              text: isLoading ? '저장중' : '작성 완료',
              isFullWidth: true,
              isEnabled: isValid,
              rightWidget: isLoading
                  ? Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: SizedBox(
                        width: 15,
                        height: 15,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : null,
              onTap: () {
                final title = titleController.text;
                final price = int.parse(priceController.text);
                final desc = descriptionController.text;
                setState(() {
                  isLoading = true;
                });
                //if (imageList.isEmpty) imageList.add(picSum(202));
                final product = Product(user3, title, price, ProductStatus.normal, imageList);
                final newPost = SimpleProductPost(
                  6,
                  user3,
                  product,
                  title,
                  Address('서울시 강남구 역삼동', '역삼동'),
                  0,
                  0,
                  DateTime.now(),
                );

                ref.read(postProvider.notifier).upDate(newPost);
                Nav.pop(context);
                Nav.push(PostDetailScreen(
                  newPost.id,
                  simpleProductPost: newPost,
                ));
              },
            ),
    );
  }

  bool get isValid =>
      isNotBlank(titleController.text) && isNotBlank(priceController.text) && isNotBlank(descriptionController.text);
}

class _ImageSeletWidget extends StatelessWidget {
  _ImageSeletWidget(this.imageList, {required this.onTapDeletedImage, required this.onTap, super.key});
  final List<String> imageList;
  final void Function() onTap;
  final void Function(String path) onTapDeletedImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SelectImageButton(onTap: onTap, imageList: imageList),
            ...imageList.map(
              (e) => Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Container(
                      // margin: const EdgeInsets.all(10),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.file(
                          File(e),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Tap(
                        onTap: () {
                          onTapDeletedImage(e);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, bottom: 30),
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: const Icon(Icons.add_circle),
                          ),
                        ),
                      ),
                    ),
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

class SelectImageButton extends StatelessWidget {
  const SelectImageButton({
    super.key,
    required this.onTap,
    required this.imageList,
  });

  final void Function() onTap;
  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, top: 8),
        child: Container(
          // padding: const EdgeInsets.all(10),
          //margin: const EdgeInsets.all(10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.camera_alt),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: imageList.length.toString(),
                      style: const TextStyle(color: Colors.orange),
                    ),
                    const TextSpan(text: '/10'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleEditor extends StatelessWidget {
  _TitleEditor(this.controller, {super.key});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '제목',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Height(10),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: '제목',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PriceEditor extends StatefulWidget {
  _PriceEditor(this.controller, {super.key});
  final TextEditingController controller;

  @override
  State<_PriceEditor> createState() => _PriceEditorState();
}

class _PriceEditorState extends State<_PriceEditor> {
  bool isDonateMode = false;
  final priceNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '거래방식',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Height(10),
        Row(
          children: [
            RoundButton(
                text: '판매하기',
                theme: isDonateMode ? RoundButtonTheme.blackWithWhitekBorder : RoundButtonTheme.whiteWithBlackBorder,
                onTap: () {
                  widget.controller.clear();
                  FocusScope.of(context).unfocus();
                  delay(() {
                    FocusScope.of(context).requestFocus(priceNode);
                  });

                  setState(() {
                    isDonateMode = false;
                  });
                }),
            const Width(10),
            RoundButton(
              text: '나눔하기',
              theme: isDonateMode ? RoundButtonTheme.whiteWithBlackBorder : RoundButtonTheme.blackWithWhitekBorder,
              onTap: () {
                setState(() {
                  widget.controller.text = '0';
                  isDonateMode = true;
                });
              },
            ),
          ],
        ),
        const Height(10),
        TextField(
          focusNode: priceNode,
          controller: widget.controller,
          keyboardType: TextInputType.number,
          //   scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 100),
          decoration: InputDecoration(
            enabled: !isDonateMode,
            hintText: 'input_price'.tr(namedArgs: {'test': '홍길동'}),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DescEditor extends StatelessWidget {
  _DescEditor(this.controller, {super.key});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '자세한 설명',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Height(10),
        TextField(
          controller: controller,
          maxLines: 7,
          decoration: const InputDecoration(
            hintText: 'xx 에 올릴 게시글 내용을 작성해 주세요',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
