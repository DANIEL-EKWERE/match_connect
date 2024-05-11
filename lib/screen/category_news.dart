import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchconnect/models/show_category.dart';
import 'package:matchconnect/screen/article_views.dart';
import 'package:matchconnect/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  final String name;
  const CategoryNews({required this.name, super.key});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> showCategoryModel = [];
  bool _loading = true;

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategories(widget.name.toLowerCase());
    showCategoryModel = showCategoryNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xff000000),
      appBar: AppBar(
                 backgroundColor: const Color(0xff292929),
        title: Text(
          '${widget.name} News',
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: showCategoryModel.length,
                itemBuilder: (context, index) {
                  return ShowCategory(
                    image: showCategoryModel[index].urlToImage!,
                    desc: showCategoryModel[index].description!,
                    title: showCategoryModel[index].title!,
                    url: showCategoryModel[index].url!,
                    urlToImage: showCategoryModel[index].urlToImage!,
                  );
                },
              ),
            ),
    );
  }
}

class ShowCategory extends StatelessWidget {
  final String image, desc, title, url, urlToImage;
  const ShowCategory(
      {required this.image,
      required this.desc,
      required this.title,
      required this.url,
      required this.urlToImage,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => ArticleView(blogUrl: url),
            ));
      },
      child: SizedBox(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              desc,
              style: const TextStyle(color: Colors.white54, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
