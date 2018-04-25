require 'selenium-webdriver'
require 'pp'

profile = Selenium::WebDriver::Firefox::Profile.new

# ファイルをダウンロードする既定のフォルダ
# - 0: デスクトップ
# - 1: システム既定のダウンロードフォルダ
# - 2: ユーザ定義フォルダ (browser.download.dir で指定)
profile['browser.download.folderList'] = 2

# ダウンロード先を指定 (バックスラッシュが二つ必要。環境によっては1つだけでいいかも)
profile['browser.download.dir'] = 'C:\Users\YourName\Desktop'

# ファイルをポップアップボックスなしで自動的に保存 (CSVファイルの例)
profile['browser.download.useDownloadDir'] = true
profile['browser.helperApps.neverAsk.saveToDisk'] = 'text/plain,application/vnd.ms-excel,text/csv,text/comma-separated-values,application/octet-stream'

puts 'firefoxを起動してbitbankの資産ページを開きます・・・'

driver = Selenium::WebDriver.for :firefox, profile: profile
driver.get 'https://bitbank.cc/app/account/trade_history'

puts 'ログインページが表示されたらログインしてください。'
puts '資産のページが表示されたら、何かキーを押してください・・・'
puta '自動で、取引履歴をダウンロードします。'
gets

loop do
  csvdownloadlink = driver.find_element(:xpath, '/html/body/app/ng-component/mat-sidenav-container/mat-sidenav-content/div/ng-component/div/div/ng-component/div/div[6]/a')
  puts 'ダウンロードリンクをクリックします・・・'
  csvdownloadlink.click
  puts 'ダウンロードリンクをクリックしました。（ダウンロードが終わるまで）３分待ちます・・・'
  sleep(180) # 3 minutes

  puts 'ページを再表示します。３分ごと１時間、合計１９回。（クリック後の３分を含めて２０回＝１時間）'
  (1..2).each do |cnt|
    print(cnt)
    print(' ')
    driver.navigate.refresh
    sleep(180) # 3 minutes
  end
  puts ''
end
