import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';
import 'package:html/parser.dart' show parse;
import 'package:dio/dio.dart';
// above are site parse methods

class SiteParse {
  // MoeImg

  //*[@id="main-2"]/div[3]/div/div[1]/a
  //*[@id="main-2"]/div[3]/div/div[1]/a
  //*[@id="main-2"]/div[3]/div/div[1]/a/div/img
  //*[@id="main-2"]/div[4]/div/div[1]/a

  // 很有趣，主页 是由 DIV[4]开始
  // 但是分类页 是由 DIV[3]开始

  static siteSrcMoeimg(HtmlXPath html, int i) => html
      .query('//*[@id="main-2"]/div[${i + 3}]/div/div[1]/a/div/img/@src')
      .attrs[0]!;
  static siteHrefMoeimg(HtmlXPath html, int i) => html
      .query('//*[@id="main-2"]/div[${i + 3}]/div/div[1]/a/@href')
      .attrs[0]!;
  static siteTitleMoeimg(HtmlXPath html, int i) => html
      .query('//*[@id="main-2"]/div[${i + 3}]/div/div[1]/a/@title')
      .attrs[0]!;

  // Gnnji

  static siteSrcGnnji(HtmlXPath html, int i) => html
      .query('//*[@id="tile-2"]/div[i]/section/figure/a/img/@src')
      .attrs[0]!;
  static siteHrefGnnji(HtmlXPath html, int i) =>
      html.query('//*[@id="tile-2"]/div[i]/section/figure/a/@href').attrs[0]!;
  static siteTitleGnnji(HtmlXPath html, int i) =>
      html.query('//*[@id="tile-2"]/div[2]/section/h2/a');

  static List src = [siteSrcMoeimg, siteSrcGnnji];
  static List href = [siteHrefMoeimg, siteHrefGnnji];
  static List title = [siteTitleMoeimg, siteTitleGnnji];

  // is there any explict way to do this?

}

// above are page parse methods

class PageParse {
  static List<String> moeImg({required Response response}) {
    final document = parse(response.data).documentElement!;
    final html = HtmlXPath.node(document);
    String postSingle =
        document.getElementsByClassName("post-single")[0].innerHtml;
    var rawAddress = parse(postSingle).getElementsByClassName("box");
    List<String> picAddress = [];

    picAddress.add(
        html.query('//*[@id="main-2"]/div[2]/div/div[2]/a/img/@src').attrs[0]!);

    for (var i = 2; i < rawAddress.length; i++) {
      picAddress.add(html
          .query('//*[@id="main-2"]/div[2]/div/div[${i + 7}]/a/@href')
          .attrs[0]!);
    }
    return picAddress;
  }

  // static List<String> gnnji({required Response response}) {}
}
