# auto_csv_download

## はじめに
無保証です。

## これは何？
[BitBank](https://bitbank.cc/)から取引履歴CSVを自動ダウンロードするプログラムです。

rubyプログラムから「selenium-webdriver」を使いウェブブラウザ「Firefox」を制御することで、自動ダウンロードを実現しています。

## 必要なもの
### 1.ruby実行環境
### 2.gem 「selenium-webdriver」とFirefox用「WebDriver」
[Qiita](https://qiita.com/yulily@github/items/c3edbe25e84280c17776)さんの記事や[atmarkit](http://www.atmarkit.co.jp/ait/articles/1210/05/news104.html)さんの記事等を参考に、gem「selenium-webdriver」とFirefox用「WebDriver」をインストールしてください。

gemはおそらく
```
gem install selenium-webdriver
```
でインストールできると思います。

WebDriverは [ここ](https://www.seleniumhq.org/download/)の中の「Third Party Drivers, Bindings, and Plugins」の中にある「Mozilla GeckoDriver」の横の「[latest  ](https://github.com/mozilla/geckodriver/releases)」の中にあるgeckodirver-vX.XX.X-OSNAME.tar.gz(.zip)のいずれかです。実行環境する環境に合致するものをダウンロードしてください。展開すると実行ファイル（バイナリファイル）が入っていますので、パスの通ったディレクトリに配置してください。

### 3.ウェブブラウザ「Firefox」
（本プログラムはFirefox用に作成・動作確認しています。）

## 使い方
本プログラムは実行されると、

```
firefoxを起動してbitbankの資産ページを開きます・・・
ログインページが表示されたらログインしてください。
資産のページが表示されたら、Enterキーを押してください・・・
自動で、取引履歴をダウンロードします。
```

と表示し、Firefoxを起動させ、[bitbankの資産のページ](https://bitbank.cc/app/account/trade_history)を開こうとします。
しかし、本プログラムはbitbankへのログインは行いません。起動されたfirefox上で __ユーザー自身でログインしてください。__
ログインできたら、（ターミナル/コマンドプロンプトで）Enterキーを押してください。

そうすると、取引履歴CSVをダウンロードします。

あとは、約１時間に１回、取引履歴CSVをダウンロードするのを繰り返します。ダウンロードしていないときは、３分に１回、取引履歴のページをリロードします。

## ポイント
### gem 「selenium-webdriver」とFirefox用「WebDriver」のインストールが大変
→OSの種類、bit数、ブラウザに合わせて適切にダウンロードする必要があり、また、パスを通す必要がある
### このプログラムはbitbankからダウンロードは行うがログインは行わない
→ユーザーがログインをする必要がある
