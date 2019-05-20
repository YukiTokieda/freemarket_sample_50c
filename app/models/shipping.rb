class Shipping < ApplicationRecord
  has_one :product

  enum fee_burdens: {
    postage_included: '送料込み（出品者負担）', 
    cash_on_delivery: '着払い（購入者負担）'
  }

  enum methods: {
    undecided: '未定', 
    easy_mercari: 'らくらくメルカリ便',
    yuyu_merucari: 'ゆうゆうメルカリ便',
    large_easy_merucari: '大型らくらくメルカリ便', 
    yu_mail: 'ゆうメール', 
    letter_pack: 'レターパック', 
    regular_mail: '普通郵便(定形・定形外)', 
    yamato_transport: 'クロネコヤマト', 
    yu_pack: 'ゆうパック', 
    click_post: 'クリックポスト', 
    yu_pakcet: 'ゆうパケット'
  }

  enum period_before_shippings: {
    in_two_days: '1~2日で発送', 
    in_three_days: '2~3日で発送', 
    in_seven_days: '4~7日で発送'
  }

  enum froms: {
    hokkaido: '北海道', aomori: '青森', iwate: '岩手', miyagi: '宮城', akita: '秋田', yamagata: '山形', fukushima: '福島',ibaraki: '茨城', tochigi: '栃木', gunma: '群馬', 
    saitama: '埼玉', chiba: '千葉', tokyo: '東京', kanagawa: '神奈川',niigata: '新潟', toyama: '富山', ishikawa: '石川', fukui: '福井', yamanashi: '山梨', nagano: '長野',
    gifu: '岐阜', shizuoka: '静岡', aichi: '愛知', mie: '三重',shiga: '滋賀', kyoto: '京都', osaka: '大阪', hyogo: '兵庫', nara: '奈良', wakayama: '和歌山',
    tottori: '鳥取', shimane: '島根', okayama: '岡山', hiroshima: '広島', yamaguchi: '山口', tokushima: '徳島', kagawa: '香川', ehime: '愛媛', kochi: '高知', fukuoka: '福岡', 
    saga: '佐賀', nagasaki: '長崎', kumamoto: '熊本', oita: '大分', miyazaki: '宮崎', kagoshima: '鹿児島', okinawa: '沖縄'
  }
end
