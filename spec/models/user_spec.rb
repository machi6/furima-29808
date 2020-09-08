require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '新規登録' do
    it "ニックネームが必須であること" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "メールアドレスが必須であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは@を含む必要があること" do
      @user.email = "abcdegmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが必須であること" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードは6文字以上であること" do
      @user.password = "abcd0"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数字混合であること（英字のみの場合）" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
    end

    it "パスワードは半角英数字混合であること（数字のみの場合）" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください")
    end

    it "パスワードは確認用を含めて2回入力すること" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "ユーザー本名が、名字と名前がそれぞれ必須であること（名字のみ入力した場合）" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名が、名字と名前がそれぞれ必須であること（名前のみ入力した場合）" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること（名字のチェック）" do
      @user.family_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること（名前のチェック）" do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること（名字のチェック）" do
      @user.family_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana 全角カタカナを使用してください")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力させること（名前のチェック）" do
      @user.first_name_kana = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
    end

    it "生年月日が必須であること" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

  end
    
end
