import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsListScreen(),
    );
  }
}

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita Terbaru'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          final newsId = (index + 1).toString();
          return ListTile(
            title: Text('Berita $newsId'),
            subtitle: Text('Deskripsi Berita $newsId'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailScreen(
                    newsId: newsId,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({Key? key, required this.newsId}) : super(key: key);
  final String newsId;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Berita'),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Image.network(
              "https://picsum.photos/seed/picsum/400/200",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(
                  'berita ka ${widget.newsId}. Kamu harus berhenti merasa sirik pada orang lain dan fokuslah pada pencapaianmu sendiri. Kita semua memiliki perjalanan hidup yang berbeda dan semuanya memiliki kesulitan masing-masing. Jangan biarkan perasaan iri menguasaimu dan menghambatmu untuk mencapai kesuksesanmu sendiri. Jadilah inspirasi bagi dirimu sendiri dan orang lain. Ingatlah bahwa kesuksesanmu tidak akan membuat keberhasilan orang lain merosot, sebaliknya kesuksesanmu dapat memberi inspirasi bagi orang lain untuk mencapai tujuannya..',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
