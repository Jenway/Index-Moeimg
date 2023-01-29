import 'package:xpath_selector_html_parser/xpath_selector_html_parser.dart';

class SiteParse {
  // MoeImg erotic (unHomePage)

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
      .query('//*[@id="tile-2"]/div[${i + 1}]/section/figure/a/img/@src')
      .attrs[0]!;
  static siteHrefGnnji(HtmlXPath html, int i) => html
      .query('//*[@id="tile-2"]/div[${i + 1}]/section/h2/a/@href')
      .attrs[0]!;
  static siteTitleGnnji(HtmlXPath html, int i) => html
      .query('//*[@id="tile-2"]/div[${i + 1}]/section/h2/a/text()')
      .attrs[0]!;

  // 今夜のシチュエロ画像

//*[@id^="post-"]/figure/a/@href
//*[@id^="post-"]/figure/a/@title
//*[@id^="post-"]/figure/a/img/@src

  static siteSrcJinshi(HtmlXPath html, int i) =>
      html.query('//*[@id^="post-"]/figure/a/img/@src').attrs[i]!;
  static siteHrefJinshi(HtmlXPath html, int i) =>
      html.query('//*[@id^="post-"]/figure/a/@href').attrs[i]!;
  static siteTitleJinshi(HtmlXPath html, int i) =>
      html.query('//*[@id^="post-"]/figure/a/@title').attrs[i]!;

  static List src = [siteSrcMoeimg, siteSrcGnnji, siteSrcJinshi];
  static List href = [siteHrefMoeimg, siteHrefGnnji, siteHrefJinshi];
  static List title = [siteTitleMoeimg, siteTitleGnnji, siteTitleJinshi];

  // is there any explict way to do this?
}

// above are page parse methods
//*[@id="main-2"]/div[2]/div/div[2]/a
//*[@id="main-2"]/div[2]/div/div[9]/a
class PageParse {
  static List<String> moeImg({required HtmlXPath html}) => html
      .query('//*[@id="main-2"]/div[2]/div/div[@class="box"]/a/@href')
      .attrs
      .cast<String>();
  static List<String> gnnji({required HtmlXPath html}) => html
      .query(
          '//*[@id="mainEntity"]/div[1]/figure/ul/li[@class="blocks-gallery-item"]/figure/a/@href')
      .attrs
      .cast<String>();

//*[@id="the-content"]/p[1]/a/img
//*[@id="the-content"]/p[2]/a[1]/img
//*[@id="the-content"]/p[2]/a[@target="_blank"]/img

  static List<String> jinshi({required HtmlXPath html}) => html
      .query('//*[@id="the-content"]/p[2]/a[@target="_blank"]/img/@src')
      .attrs
      .cast<String>();

  static List<Function> page = [moeImg, gnnji, jinshi];
}
