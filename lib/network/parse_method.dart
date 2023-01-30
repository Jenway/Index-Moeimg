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
  static siteSrcJinshi(HtmlXPath html, int i) =>
      html.query('//*[@id^="post-"]/figure/a/img/@src').attrs[i]!;
  static siteHrefJinshi(HtmlXPath html, int i) =>
      html.query('//*[@id^="post-"]/figure/a/@href').attrs[i]!;
  static siteTitleJinshi(HtmlXPath html, int i) =>
      html.query('//*[@id^="post-"]/figure/a/@title').attrs[i]!;

  // キモ男陵辱同人道

//*[@id="list"]/div[2]/section/figure/a/img
//*[@id="list"]/div[3]/section/figure/a

  static siteSrcKimonan(HtmlXPath html, int i) => html
      .query(
          '//*[@id="list"]/div[@class="toc grid clearfix"]/section/figure/a/img/@src')
      .attrs[i]!;
  static siteHrefKimonan(HtmlXPath html, int i) => html
      .query(
          '//*[@id="list"]/div[@class="toc grid clearfix"]/section/figure/a/@href')
      .attrs[i]!;
  static siteTitleKimonan(HtmlXPath html, int i) => html
      .query(
          '//*[@id="list"]/div[@class="toc grid clearfix"]/section/figure/a/@aria-label')
      .attrs[i]!;

// イチヌケ
//反扒，似乎与svg有关
//*[@id="post-57123"]/figure/img
//*[@id="post-57123"]/figure/img
//*[@id="list"]/a[3]
//*[@id="post-57123"]/figure/img
  static siteSrcIchinuke(HtmlXPath html, int i) =>
      'https://ichinuke.com/wp-content/uploads/2022/11/zuriana10-1-473x266.jpg';

  static siteHrefIchinuke(HtmlXPath html, int i) =>
      html.query('//div[@id="list"]/a/@href').attrs[i]!;

  static siteTitleIchinuke(HtmlXPath html, int i) =>
      html.query('//div[@id="list"]/a/@title').attrs[i]!;

// 桃色虹画像 -二次元萌え（にじもえ）エロ画像まとめ-
//疑似反扒，似乎与gif有关
//*[@id="post-839676"]/figure/img
//*[@id="post-803184"]/figure/img
//*[@id="list"]/a[12]

//*[@id="post-826371"]/figure/img
//*[@id="post-826371"]/figure/img
//html/body/div[1]/div[3]/div/main/aside/div/div/a[3]/article/figure/img
//html/body/div[1]/div[3]/div/main/div[1]/a[1]/article/figure/img
// http://momoniji.com/wordpress/wp-content/uploads/2020/01/panchira-erogaou20200201013.jpg
  // static siteSrcMomoniji(HtmlXPath html, int i) => html
  //     .query('//main[@id="main"]/div[1]/a/article/figure/img/@src')
  //     .attrs[i]!;
  static siteSrcMomoniji(HtmlXPath html, int i) => html
      .query('//main[@id="main"]/div[1]/a/article/figure/img/@src')
      .attrs[i]!;

  static siteHrefMomoniji(HtmlXPath html, int i) =>
      html.query('//*[@id="list"]/a/@href').attrs[i]!;
  static siteTitleMomoniji(HtmlXPath html, int i) =>
      html.query('//*[@id="list"]/a/@title').attrs[i]!;

  //二次ろぐぴんく

  //*[@id="list"]/div[2]/section/h2/a
  //*[@id="tile-2"]/div[1]/section/h2/a
  //*[@id="tile-2"]/div[2]/section/h2/a
//html/body/div[3]/div[3]/div[1]/main/div/div/div[2]/section/h2/a
//html/body/div[3]/div[3]/div[1]/main/div/div/div[3]/div[1]/section/h2/a
//html/body/div[3]/div[3]/div[1]/main/div/div/div[3]/div[2]/section/h2/a
//*[@id="tile-2"]/div[1]/section/figure/a/img
  static siteSrcNijilog(HtmlXPath html, int i) => html
      .query('//*[@class="toc grid clearfix"]/section/figure/a/img/@src')
      .attrs[i]!;
  static siteHrefNijilog(HtmlXPath html, int i) => html
      .query('//*[@class="toc grid clearfix"]/section/h2/a/@href')
      .attrs[i]!;
  static siteTitleNijilog(HtmlXPath html, int i) => html
      .query('//*[@class="toc grid clearfix"]/section/h2/a/text()')
      .attrs[i]!;

//hentai-witch
//html/body/div/div[4]/div/main/div[1]/a[1]/article/figure/img
  static siteSrcHentaiWitch(HtmlXPath html, int i) =>
      html.query('//*[@id="list"]/a/article/figure/img/@src').attrs[i]!;
  static siteHrefHentaiWitch(HtmlXPath html, int i) =>
      html.query('//*[@id="list"]/a/@href').attrs[i]!;
  static siteTitleHentaiWitch(HtmlXPath html, int i) =>
      html.query('//*[@id="list"]/a/@title').attrs[i]!;

//虹フェチちゃんねる

  static siteSrcNijifetich(HtmlXPath html, int i) =>
      'https://nijifeti.com/wp-content/uploads/2023/01/kurokami-072-19.jpg';
  static siteHrefNijifetich(HtmlXPath html, int i) =>
      html.query('//*[@id^="post"]/h2/a/@href').attrs[i]!;
  static siteTitleNijifetich(HtmlXPath html, int i) =>
      html.query('//*[@id^="post"]/h2/a/text()').attrs[i]!;

  static List src = [
    siteSrcMoeimg,
    siteSrcGnnji,
    siteSrcJinshi,
    siteSrcKimonan,
    siteSrcIchinuke,
    siteSrcMomoniji,
    siteSrcNijilog,
    siteSrcHentaiWitch,
    siteSrcNijifetich,
  ];
  static List href = [
    siteHrefMoeimg,
    siteHrefGnnji,
    siteHrefJinshi,
    siteHrefKimonan,
    siteHrefIchinuke,
    siteHrefMomoniji,
    siteHrefNijilog,
    siteHrefHentaiWitch,
    siteHrefNijifetich,
  ];
  static List title = [
    siteTitleMoeimg,
    siteTitleGnnji,
    siteTitleJinshi,
    siteTitleKimonan,
    siteTitleIchinuke,
    siteTitleMomoniji,
    siteTitleNijilog,
    siteTitleHentaiWitch,
    siteTitleNijifetich,
  ];

  // is there any explict way to do this?
}

// above are page parse methods

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

  static List<String> jinshi({required HtmlXPath html}) => html
      .query('//*[@id="the-content"]/p[2]/a[@target="_blank"]/img/@src')
      .attrs
      .cast<String>();

  static List<String> kimonan({required HtmlXPath html}) => html
      .query('//*[@id="mainEntity"]/div[1]/div[2]/a/@href')
      .attrs
      .cast<String>();

  static List<String> ichinuke({required HtmlXPath html}) => html
      .query(
          '//*[@id^="post"]/div/figure/figure[@class="wp-block-image size-large"]/a/@href')
      .attrs
      .cast<String>();

  static List<String> momoniji({required HtmlXPath html}) =>
      html.query('//*[@id^="post"]/div[2]/ol/li/a/@href').attrs.cast<String>();

  static List<String> nijilog({required HtmlXPath html}) => html
      .query('//*[@id="mainEntity"]/div[2]/p/a/img/@src')
      .attrs
      .cast<String>();

  static List<String> hentaiWitch({required HtmlXPath html}) =>
      html.query('//*[@id^="post"]/div[2]/figure/a/@href').attrs.cast<String>();

  static List<String> nijifetich({required HtmlXPath html}) =>
      html.query('//*[@id="main-content"]/ol/li/a/@href').attrs.cast<String>();

  static List<Function> page = [
    moeImg,
    gnnji,
    jinshi,
    kimonan,
    ichinuke,
    momoniji,
    nijilog,
    hentaiWitch,
    nijifetich,
  ];
}
