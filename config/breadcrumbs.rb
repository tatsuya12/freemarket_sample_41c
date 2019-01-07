crumb :root do
  link "メルカリ", root_path
end

#マイページのルーティングを整えたらパス変更してね！
crumb :mypage do
  link "マイページ", root_path
end

#プロフィールのルーティングを整えたらパス変更してね！
crumb :mydata do |mydata|
  link "プロフィール", root_path
  parent :mypage
end

#本人情報の登録のルーティングを整えたらパス変更してね！
crumb :user_confirmation do |user_confirmation|
  link "本人情報の登録", root_path
  parent :mypage
end

#ログアウトのルーティングを整えたらパス変更してね！
crumb :logout do |logout|
  link "ログアウト", root_path
  parent :mypage
end

#支払い方法のルーティングを整えたらパス変更してね！
crumb :credit do |credit|
  link "支払い方法", root_path
  parent :mypage
end

#クレジットカード情報入力のルーティングを整えたらパス変更してね！
crumb :credit_detail do |credit_detail|
  link "クレジットカード情報入力", root_path
  parent :credit
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).