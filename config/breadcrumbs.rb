crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :profile do
  link "プロフィール"
  parent :mypage
end

crumb :card do
  link "支払い方法"
  parent :mypage
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end

crumb :edit do
  link "本人情報の登録"
  parent :mypage
end

crumb :product do |product|
  link product.name
  parent :root
end
