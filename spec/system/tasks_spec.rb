require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      @user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@sample.com', password: '1111')
      FactoryBot.create(:task ,name: '最初のタスク', user: @user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@sample.com'
        fill_in 'パスワード', with: '1111'
        click_button 'ログインする'
      end

      it 'ユーザーAが作成したタスクが表示される' do
        expect(current_path).to eq(root_path)
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end
