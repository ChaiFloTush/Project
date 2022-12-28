require 'rails_helper'

RSpec.describe "Articles", type: :system do
=begin
  describe 'root in russian' do

    it 'page has a button' do
      visit root_path(locale: :ru)
      expect(page).to have_link("Создай свой персональный туториал")
    end

    it 'changes locale from rus to eng' do
      visit root_path(locale: :ru)
      click_on 'Английский'
      expect(page).to have_current_path(root_path(locale: :en))
    end

    it 'redirects to authorization' do
      visit root_path(locale: :ru)
      click_on 'Создай свой персональный туториал'
      expect(page).to have_current_path(new_user_session_path(locale: :ru))
    end

    it 'redirects to authorization' do
      visit root_path(locale: :ru)
      click_on 'Создай свой персональный туториал'
      expect(page).to have_current_path(new_user_session_path(locale: :ru))
    end

    it 'redirects to authorization' do
      visit root_path(locale: :ru)
      click_on 'Вход'
      expect(page).to have_current_path(new_user_session_path(locale: :ru))
    end

  end

  describe 'root in english' do

    it 'page has a button' do
      visit root_path(locale: :en)
      expect(page).to have_link("Create your own tutorial")
    end

    it 'changes locale from eng to rus' do
      visit root_path(locale: :en)
      click_on 'Russian'
      expect(page).to have_current_path(root_path(locale: :ru))
    end

    it 'redirects to authorization' do
      visit root_path(locale: :en)
      click_on 'Create your own tutorial'
      expect(page).to have_current_path(new_user_session_path(locale: :en))
    end

    it 'redirects to authorization' do
      visit root_path(locale: :en)
      click_on 'Create your own tutorial'
      expect(page).to have_current_path(new_user_session_path(locale: :en))
    end

  end
=end
  describe 'creating new article' do
  #  visit new_article_path(locale: :ru)
   # fill_in('title', :with => 'Rspec')
  # click_button('submit')
  #  expect(page).to have_current_path(root_path(locale: :ru))
  end

end
