crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
end

crumb :mydata do |mydata|
  link "プロフィール", profile_mypage_path
  parent :mypage
end

crumb :user_confirmation do |user_confirmation|
  link "本人情報の登録", user_confirmation_mypage_path
  parent :mypage
end

crumb :logout do |logout|
  link "ログアウト", sign_out_path
  parent :mypage
end

crumb :credit do |credit|
  link "支払い方法", credit_mypage_path
  parent :mypage
end

crumb :credit_detail do |credit_detail|
  link "クレジットカード情報入力", credit_detail_mypage_path
  parent :credit
end

crumb :show do |item|
  link item.name, root_path
end

crumb :search do |keyword|
  link keyword, root_path
end