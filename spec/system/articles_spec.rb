require 'rails_helper'

RSpec.describe "Articles", type: :system do
  describe 'root in russian' do
    # проверяет, что локализация переводит на русский
    it 'page has a button' do
      visit root_path(locale: :ru)
      expect(page).to have_link("Создай свой персональный туториал")
    end
    # проверяет, что кнопка смены локализации меняет язык на английский
    it 'changes locale from rus to eng' do
      visit root_path(locale: :ru)
      click_on 'Английский'
      expect(page).to have_current_path(root_path(locale: :en))
    end
    # проверяет, что и другие страницы переведены на русский
    it 'redirects to authorization' do
      visit root_path(locale: :ru)
      click_on 'Создай свой персональный туториал'
      expect(page).to have_current_path(new_user_session_path(locale: :ru))
    end
  end
  describe 'root in english' do
    # проверяет, что локализация переводит на английский
    it 'page has a button' do
      visit root_path(locale: :en)
      expect(page).to have_link("Create your own tutorial")
    end
    # проверяет, что кнопка смены локализации меняет язык на русский
    it 'changes locale from eng to rus' do
      visit root_path(locale: :en)
      click_on 'Russian'
      expect(page).to have_current_path(root_path(locale: :ru))
    end
    # проверяет, что и другие страницы переведены на английский
    it 'redirects to authorization' do
      visit root_path(locale: :en)
      click_on 'Create your own tutorial'
      expect(page).to have_current_path(new_user_session_path(locale: :en))
    end
  end
  describe 'authentication' do
    # проверяет регистрацию
    it 'sign in' do
        visit root_path(locale: :ru)
        click_on 'Войти'
        click_on 'Зарегистрироваться'
        fill_in('Имя', :with => 'Rspec')
        fill_in('Имейл', :with => 'rspec@gmail.com')
        fill_in('Пароль', :with => 'rspec@gmail.com')
        fill_in('Подтверждение пароля', :with => 'rspec@gmail.com')
        click_button('Зарегистрироваться')
        page.should have_content('Rspec')
    end
    # проверяет авторизацию, создание и редактирование туториала
    it 'creates new article' do
      User.create(:name => "Rspec", :email => "rspec@gmail.com", :password => "rspec@gmail.com")
      visit root_path(locale: :ru)
      click_on 'Войти'
      fill_in('Имейл', :with => 'rspec@gmail.com')
      fill_in('Пароль', :with => 'rspec@gmail.com')
      click_button('Войти')
      click_on 'Создай свой персональный туториал'
      fill_in('Заголовок', :with => 'Rspec')
      click_button('Создать туториал')
      page.should have_content('Туториал был успешно создан')
      click_on 'Редактировать'
      click_button('Сохранить туториал')
      page.should have_content('Туториал был успешно обновлен')
    end
    # проверяет, что у админа есть дополнительная функция
    it 'check admin' do
      User.create(:name => "Rspec", :email => "rspec@gmail.com", :password => "rspec@gmail.com")
      User.create(:name => "Admin", :email => "admin@gmail.com", :password => "admin@gmail.com")
      visit root_path(locale: :ru)
      click_on 'Войти'
      fill_in('Имейл', :with => 'admin@gmail.com')
      fill_in('Пароль', :with => 'admin@gmail.com')
      click_button('Войти')
      click_on 'Список пользователей'
      expect(page).not_to have_current_path(all_users_path)
    end
  end
end
