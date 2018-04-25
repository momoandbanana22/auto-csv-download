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

puts 'ログインして資産のページが表示されたら、取引履歴をダウンロードするので、何かキーを押してください・・・'
gets

loop do
  sleep(60)
  csvdownloadlink = driver.find_element(:xpath, '/html/body/app/ng-component/mat-sidenav-container/mat-sidenav-content/div/ng-component/div/div/ng-component/div/div[6]/a')
  sleep(60)
  puts 'ダウンロードリンクをクリックします・・・'
  csvdownloadlink.click
  puts 'ダウンロードリンクをクリックしました'

  puts 'ページを再表示します。３分ごと１時間、合計２０回。'
  (1..20).each do |cnt|
    puts(cnt)
    driver.navigate.refresh
    sleep(180) # 3 minutes
  end
end